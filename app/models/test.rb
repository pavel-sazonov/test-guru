class Test < ApplicationRecord

# первый вариант
  def self.allTestTitleByCategory(categoryTitle)
    # DESC - по убыванию? (10, 9, 8 ...)
    return Test.where('category_id = 1').order('title DESC').pluck(:title) if categoryTitle == 'frontend'
    Test.where('category_id = 2').order('title DESC').pluck(:title)
  end

# второй вариант
  def self.allTestTitleByCategoryTwo(testCategory)
    Test.joins("JOIN categories ON categories.id = tests.category_id").where("categories.title = ?", testCategory).order('title DESC')
  end
end
