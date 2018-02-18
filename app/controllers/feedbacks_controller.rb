class FeedbacksController < ApplicationController
  before_action :authenticate_user!

  def new
    @feedback = Feedback.new
  end

  def create
    @feedback = current_user.feedbacks.new(feedback_params)

    if @feedback.save
      admin = User.find_by(type: 'Admin')
      FeedbacksMailer.sent_feedback(@feedback, admin).deliver_now
      redirect_to new_feedback_path, notice: 'feedback sent'
    else
      render :new, alert: 'feedback did not send'
    end
  end

  private

  def feedback_params
    params.require(:feedback).permit(:title, :body)
  end
end
