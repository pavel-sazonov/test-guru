class User < ApplicationRecord

  def all_tests_by_level(test_level)
    Test.where(level: test_level)
  end
end
