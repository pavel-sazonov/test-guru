class Admin::BadgesController < Admin::BaseController
  before_action :set_badge, only: %i[show]

  def index
    @badges = Badge.all
  end

  def show;end

  private

  def set_badge
    @badge = Badge.find(params[:id])
  end
end
