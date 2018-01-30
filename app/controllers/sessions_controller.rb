class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:email])

    if user&.authenticate(params[:password])
      cookies[:current_url] ||= root_path
      session[:user_id] = user.id
      redirect_to cookies[:url]
    else
      flash.now[:alert] = 'Are you a Guru? Verify your Email and Password please'
      render :new
    end
  end

  def exit
    session[:user_id] = nil
    redirect_to login_path
  end
end
