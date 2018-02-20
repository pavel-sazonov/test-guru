class UserBadgesController < ApplicationController
  before_action :authenticate_user!

  def show
    @badges = current_user.badges.all
  end
end
