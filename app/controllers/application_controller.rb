class ApplicationController < ActionController::API
  include ExceptionHandler
  include Response

  # called before every action on controllers
  before_action :authorize_request

  attr_reader :current_user

  private

  # Check for valid request token and return user
  def authorize_request
    @current_user = (AuthorizeApiRequest.new(request.headers).call)[:user]
  end

  def get_update_params(params)
    to_delete = params.clone
    without_delete = params.clone

    to_delete[:product_in_shops_attributes] = []
    without_delete[:product_in_shops_attributes] = []

    params[:product_in_shops_attributes].each do |record|
      if record.key?("_destroy")
        to_delete[:product_in_shops_attributes].push(record)
      else
        without_delete[:product_in_shops_attributes].push(record)
      end
    end

    [to_delete, without_delete]
  end
end
