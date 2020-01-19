class ShopsController < ApplicationController
  before_action :set_shop, only: [:show, :update, :destroy]

  # GET /shops
  def index
    @shops = current_user.shops
    json_response(@shops)
  end

  # GET /shops/1
  def show
    json_response(@shop.to_json(:include => :product_in_shops))
  end

  # POST /shops
  def create
    @shop = Shop.new(shop_params)
    @shop.user = current_user

    if @shop.save
      json_response(@shop, :created, @shop)
    else
      json_response(@shop.errors, :unprocessable_entity)
    end
  end

  # PATCH/PUT /shops/1
  def update
    if @shop.update(shop_params)
      json_response(@shop)
    else
      json_response(@shop.errors, :unprocessable_entity)
    end
  end

  # DELETE /shops/1
  def destroy
    @shop.destroy
  end

  private

  # Use callbacks to share common setup or constraints between actions.
    def set_shop
      @shop = current_user.shops.find_by!(id: params[:id]) if current_user
    end

    # Only allow a trusted parameter "white list" through.
    def shop_params
      params.require(:shop).permit(:name, :address, :user_id)
    end
end
