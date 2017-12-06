class Test < ApplicationRecord

# первый вариант
  def self.all_test_title_by_category(category_title)
    # DESC - по убыванию? (10, 9, 8 ...)
    return Test.where('category_id = 1')
               .order('title DESC')
               .pluck(:title) if category_title == 'frontend'

    Test.where('category_id = 2').order('title DESC').pluck(:title)
  end

# второй вариант
  def self.all_test_title_by_category_two(category_title)
    Test.joins("JOIN categories ON categories.id = tests.category_id")
        .where("categories.title = ?", category_title)
        .order('title DESC')
        # .pluck(:title)
  # никак не получается добавить метод pluck
  # ни через вызов по цепочке
  # ни если записать результирующую таблицу в переменную и применить к ней pluck
  # всегда ошибка:ActiveRecord::StatementInvalid: SQLite3::SQLException: ambiguous column name: title
  end
end
