class User < ApplicationRecord

  def allTestsByLevel(testLevel)
    Test.where(level: testLevel)
  end
end
