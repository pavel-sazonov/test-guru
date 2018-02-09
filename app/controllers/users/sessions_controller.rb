class Users::SessionsController < Devise::SessionsController
  def create
    super
    flash[:notice] = t('.welcome', full_name: current_user.full_name)
  end
end
