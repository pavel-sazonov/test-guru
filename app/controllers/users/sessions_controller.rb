class Users::SessionsController < Devise::SessionsController
  def create
    super
    flash[:notice] = "Hello, #{current_user.first_name} #{current_user.last_name}"
  end
end
