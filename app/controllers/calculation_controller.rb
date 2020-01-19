class CalculationController < ApplicationController

  def calculate
    products = Product.where(user_id: current_user.id, id: calculation_params.pluck(:id)).includes(:product_in_shops)
    quantities = calculation_params.pluck(:quantity)
    result = {}

    products.each_with_index do |product, p_index|

      product.product_in_shops.each do |product_in_shop|

        shop_id = product_in_shop.shop_id

        unless result.has_key?(shop_id)
          result[shop_id] = product_in_shop.shop
          result[shop_id].products_to_report = []
          result[shop_id].total = 0.0
        end

        product.price = product_in_shop.price
        product.quantity = quantities[p_index]
        result[shop_id].products_to_report.push(product.as_json(:methods => [:price, :quantity]))
        result[shop_id].total += product.quantity * product.price
      end

    end

    result = fill_in_missing_products(result.values)

    result.each do |res|
      res.total = res.total.round(2)
    end

    result.sort_by!(&:total)

    json_response( result.to_json(
        :methods => [
            :products_to_report,
            :total
    ]), :ok)
  end

  def fill_in_missing_products(result)
    all_products = calculation_params.pluck(:id)
    result.each do |shop|

      shop_products = shop.products_to_report.map { |product| product["id"]  }

      missing_products = all_products - shop_products



      if missing_products.length > 0
        missing_products = Product.where(id: missing_products, user_id: current_user)
        missing_products.each do |missing_product|
          missing_product.price = 'N/A'
          missing_product.quantity = get_quantity_by_id(missing_product.id)
          shop.products_to_report.push(missing_product.as_json(:methods => [:price, :quantity]))
        end
      end
    end

    result
  end


  private

  def get_quantity_by_id(id)
    calculation_params.each do |param|
      if param[:id] == id
        return param[:quantity]
      end
    end
  end

  def calculation_params
    params.require(:products)
  end
end