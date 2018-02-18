class FeedbacksMailer < ApplicationMailer
  before_action :find_admin

  def sent_feedback(feedback)
    @feedback = feedback

    mail to: @admin.email, from: @feedback.user.email, subject: 'new TestGuru feedback'
  end

  private

  def find_admin
    @admin = User.find_by(type: 'Admin')
  end
end
