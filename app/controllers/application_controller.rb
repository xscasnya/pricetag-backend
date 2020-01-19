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

  def get_update_params(params, nested_attributes_name = :product_in_shops_attributes)
    to_delete = params.clone
    without_delete = params.clone

    to_delete[nested_attributes_name] = []
    without_delete[nested_attributes_name] = []

    params[nested_attributes_name].each do |record|
      if record.key?("_destroy")
        to_delete[nested_attributes_name].push(record)
      else
        without_delete[nested_attributes_name].push(record)
      end
    end

    [to_delete, without_delete]
  end
end
