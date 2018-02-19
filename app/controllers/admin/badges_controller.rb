class Admin::BadgesController < Admin::BaseController
  before_action :authenticate_user!

  def index
    @badges = Badge.all
  end
end
