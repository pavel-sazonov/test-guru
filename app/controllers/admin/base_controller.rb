class Admin::BaseController < ApplicationController
  layout 'admin'

  before_action :authenticate_user!
  before_action :admin_requried!

  # after_sign_in_path_for :Admin

  private

  def admin_requried!
    redirect_to root_path, alert: "You are not authorized to view this page." unless current_user.is_a?(Admin)
  end
end
