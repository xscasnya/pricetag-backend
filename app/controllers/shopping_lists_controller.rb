class ShoppingListsController < ApplicationController
  before_action :set_shopping_list, only: [:show, :update, :destroy]

  # GET /shopping_lists
  def index
    @shopping_lists = current_user.shopping_lists
    json_response(@shopping_lists)
  end

  # GET /shops/1
  def show
    json_response(@shopping_list.to_json(
        :include => {
            :product_in_shopping_lists => {
                :except => [:product_id, :created_at, :updated_at, :shopping_list_id],
                :include => {
                    :product => {
                        :except => [:created_at, :updated_at, :user_id]
                    }
                }
            }
        },
        :except => [:created_at, :updated_at, :user_id]
    ))
  end

  # POST /shops
  def create
    @shopping_list = ShoppingList.new(shopping_list_params)
    @shopping_list.user = current_user

    if @shopping_list.save
      json_response(@shopping_list, :created, @shopping_list)
    else
      json_response(@shopping_list.errors, :unprocessable_entity)
    end
  end

  # PATCH/PUT /shops/1
  def update
    params_deletion, params_without_deletion = get_update_params(shopping_list_params, :product_in_shopping_lists_attributes)

    if @shopping_list.update_attributes(params_deletion) && @shopping_list.update_attributes(params_without_deletion)
      json_response(@shopping_list)
    else
      json_response(@shopping_list.errors, :unprocessable_entity)
    end
  end

  # DELETE /shopping_list/1
  def destroy
    @shopping_list.destroy
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_shopping_list
    @shopping_list = current_user.shopping_lists.find_by!(id: params[:id]) if current_user
  end

  # Only allow a trusted parameter "white list" through.
  def shopping_list_params
    params.require(:shopping_list).permit!
  end
end
