class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :update, :destroy]
  # TODO - check if user is owner of the product

  # GET /products
  def index
    @products = current_user.products
    json_response(@products)
  end

  # GET /products/1
  def show
    json_response(@product.to_json(:include => :product_in_shops))
  end

  # POST /products
  def create
    @product = Product.new(product_params)
    @product.user = current_user

    if @product.save
      json_response(@product, :created, @product)
    else
      json_response(@product.errors, :unprocessable_entity)
    end
  end

  # PATCH/PUT /products/1
  def update
    params_deletion, params_without_deletion = get_update_params(product_params)

    if @product.update_attributes(params_deletion) && @product.update_attributes(params_without_deletion)
      json_response(@product)
    else
      json_response(@product.errors, :unprocessable_entity)
    end
  end

  # DELETE /products/1
  def destroy
    @product.destroy
    head :no_content
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_product
    @product = current_user.products.find_by!(id: params[:id]) if current_user
  end

  # Only allow a trusted parameter "white list" through.
  def product_params
    params.require(:product).permit!
  end

end
