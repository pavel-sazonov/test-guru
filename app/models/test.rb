class Test < ApplicationRecord

  has_many :questions
  belongs_to :category

  # belongs_to :user
  # поменял на:
  belongs_to :author, class_name: 'User', foreign_key: 'user_id'

  has_many :tests_users
  has_many :users, through: :tests_users

  scope :easy, -> { where(level: 0..1) }
  scope :middle, -> { where(level: 2..4) }
  scope :hard, -> { where(level: 5..Float::INFINITY) }

  scope :by_level, -> (level) { where(level: level) }


  # def self.all_test_title_by_category(category_title)

  #   Test.joins("JOIN categories ON categories.id = tests.category_id")
  #       .where("categories.title = ?", category_title)
  #       .order('tests.title DESC')
  #       .pluck('tests.title')
  # end

  scope :by_category, -> (category) { joins(:category).where("categories.title = ?", category) }
  scope :desc, -> { order(title: :desc) }
  scope :by_category_desc, ->(category) { by_category(category).desc }
end
