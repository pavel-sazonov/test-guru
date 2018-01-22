class User < ApplicationRecord

  # has_many :tests_users
  # has_many :tests, through: :tests_users
  has_many :test_passages
  has_many :tests, through: :test_passages

  has_many :authored_tests, class_name: 'Test', foreign_key: :user_id

  # у меня вместо атрибута email - name
  validates :name, presence: true

  # def tests_by_level(level)
  #   Test.joins('JOIN users_tests ON users_tests.test_id = tests.id')
  #       .where('tests.level = ? AND users_tests.user_id = ?', level, self.id)
  # end

  # заккоментил, так как скоупов из Test уже достаточно
  # def tests_by_level(level)
  #   self.tests.by_level(level)
  # end

  def test_passage(test)
    test_passages.order(id: :desc).find_by(test_id: test.id)
  end
end
