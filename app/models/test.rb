class Test < ApplicationRecord

  has_many :questions
  belongs_to :category
  # has_and_belongs_to_many :users
  has_many :tests_users
  has_many :users, through: :tests_users


  def self.all_test_title_by_category(category_title)

    Test.joins("JOIN categories ON categories.id = tests.category_id")
        .where("categories.title = ?", category_title)
        .order('tests.title DESC')
        .pluck('tests.title')
  end
end
