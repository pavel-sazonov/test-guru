class TestPassage < ApplicationRecord
  attr_reader :number

  belongs_to :user
  belongs_to :test
  belongs_to :current_question, class_name: 'Question', optional: true
  before_validation :before_validation_set_question, on: %i[create update]

  SUCCESS_RATE = 85

  def accept!(answer_ids)
    self.correct_questions += 1 if correct_answer?(answer_ids)

    save!
  end

  def completed?
    current_question.nil?
  end

  def correct?
    correct_questions == 1
  end

  def rate
    (correct_questions.to_f / test.questions.count * 100).to_i
  end

  def test_passed?
    rate >= SUCCESS_RATE
  end

  def question_number
    test.questions.index(current_question) + 1
  end

  private

  def before_validation_set_question
    self.current_question = if current_question.nil?
                              first_question
                            else
                              next_question
                            end
  end

  def correct_answer?(answer_ids)
    correct_answers_count = correct_answers.count

    (correct_answers_count == correct_answers.where(id: answer_ids).count) &&
      correct_answers_count == answer_ids.count
  end

  def correct_answers
    current_question.answers.correct
  end

  def first_question
    test.questions.order(:id).first
  end

  def next_question
    test.questions.order(:id).where('id > ?', current_question.id).first
  end
end
