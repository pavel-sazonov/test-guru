class Test < ApplicationRecord
  def self.allTestTitleByCategory(categoryTitle)
    return Test.where('category_id = 1').order('title').pluck(:title) if categoryTitle == 'frontend'
    Test.where('category_id = 2').order('title').pluck(:title)
  end
end
