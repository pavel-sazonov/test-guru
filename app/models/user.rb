class User < ApplicationRecord

  def all_tests_by_level(test_level)
    # users_tests - таблица с двумя полями: user_id, test_id
    Test.joins('JOIN users_tests ON users_tests.test_id = tests.id')
        .where('tests.level = ?', test_level)
        .pluck('tests.title')
  end
end
