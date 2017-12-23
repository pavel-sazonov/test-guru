class Question < ApplicationRecord

  belongs_to :test
  has_many :answers

  validates :body, presence: true

  #  посмотрел у тех, кто решил уже, видел такое решение
  #  не могу понять, как оно работает?
  #  ведь length проверяет длинну для значения атрибута
  # validates :answers, length: { maximum: 4 }
end
