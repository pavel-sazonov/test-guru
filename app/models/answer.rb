class Answer < ApplicationRecord

  belongs_to :question

  validates :body, presence: true

  scope :correct, -> { where(correct: true) }

  validate :validate_answers

  def validate_answers
    errors.add(:question, 'there are can be from 1 to 4 answers') if question.answers.count >= 4
  end
end
