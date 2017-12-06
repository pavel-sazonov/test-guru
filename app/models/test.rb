class Test < ApplicationRecord
  def self.allTestTitleByCategory(categoryTitle)
    # DESC - по убыванию? (10, 9, 8 ...)
    return Test.where('category_id = 1').order('title DESC').pluck(:title) if categoryTitle == 'frontend'
    Test.where('category_id = 2').order('title DESC').pluck(:title)
  end
end
