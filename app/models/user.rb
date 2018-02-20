class User < ApplicationRecord
  devise :database_authenticatable,
         :registerable,
         :recoverable,
         :rememberable,
         :trackable,
         :validatable,
         :confirmable

  has_many :test_passages
  has_many :gists
  has_many :tests, through: :test_passages
  has_many :authored_tests, class_name: 'Test', foreign_key: :user_id
  has_many :feedbacks
  has_many :user_badges
  has_many :badges, through: :user_badges

  validates :email, presence: true,
                    uniqueness: true,
                    format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i }

  def test_passage(test)
    test_passages.order(id: :desc).find_by(test_id: test.id)
  end

  def admin?
    is_a?(Admin)
  end

  def full_name
    "#{first_name} #{last_name}"
  end

  def add_badge(rule_body)
    badges.push(Badge.find_by(rule_id: Rule.find_by(body: rule_body).id))
  end

  def passed_frontend_tests?
    front_tests = Test.where(category_id: 1).pluck(:id)
    completed_front_tests = test_passages.where(test_id: front_tests)
    passed_front_tests = completed_front_tests.where(correct_questions: 1)
    passed_front_tests.count > 0 && (passed_front_tests.count % front_tests.count).zero?
  end

  def passed_backend_tests?
    back_tests = Test.where(category_id: 2).pluck(:id)
    completed_back_tests = test_passages.where(test_id: back_tests)
    passed_back_tests = completed_back_tests.where(correct_questions: 1)
    passed_back_tests.count > 0 && (passed_back_tests.count % back_tests.count).zero?
  end

  def passed_all_tests?
    tests = Test.all
    (test_passages.where(correct_questions: 1).count % tests.count).zero?
  end
end
