class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  # private

  def after_sign_in_path_for(user)
    return admin_tests_path if user.admin?
    tests_path
  end
end
