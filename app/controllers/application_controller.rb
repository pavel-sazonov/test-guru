class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception


  private

  def rescue_with_resource_not_found
    render plain: 'Resource was not found'
  end
end
