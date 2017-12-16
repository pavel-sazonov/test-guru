class User < ApplicationRecord

  # has_and_belongs_to_many :tests
  has_many :tests_users
  has_many :tests, through: :tests_users
  has_many :tests

  def tests_by_level(test_level)
    Test.joins('JOIN users_tests ON users_tests.test_id = tests.id')
        .where('tests.level = ? AND users_tests.user_id = ?', test_level, self.id)
  end
end
