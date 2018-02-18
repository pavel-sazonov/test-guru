class FeedbacksMailer < ApplicationMailer

  def sent_feedback(feedback, admin)
    @feedback = feedback

    mail to: admin.email, from: feedback.user.email, subject: 'new TestGuru feedback'
  end
end
