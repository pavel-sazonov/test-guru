class Test < ApplicationRecord

  def self.all_test_title_by_category(category_title)

    Test.joins("JOIN categories ON categories.id = tests.category_id")
        .where("categories.title = ?", category_title).
        pluck(:title)
        .sort
        .reverse

    # Test.joins("JOIN categories ON categories.id = tests.category_id")
    #     .where("categories.title = ?", category_title)
    #     .map { |t| t.title }

    # Test.joins("JOIN categories ON categories.id = tests.category_id").where("categories.title = 'frontend'").pluck(:title).sort.reverse
  end
end
