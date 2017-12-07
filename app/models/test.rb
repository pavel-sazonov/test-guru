class Test < ApplicationRecord

  def self.all_test_title_by_category(category_title)
    Test.joins("JOIN categories ON categories.id = tests.category_id")
        .where("categories.title = ?", category_title)
        .order('title DESC').map { |t| t.title }
  end
end
