class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def after_sign_in_path_for(user)
    user.admin? ? admin_tests_path : tests_path
  end
end
