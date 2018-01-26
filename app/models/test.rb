class Test < ApplicationRecord
  has_many :questions
  belongs_to :category

  belongs_to :author, class_name: 'User', foreign_key: 'user_id'

  # has_many :tests_users
  # has_many :users, through: :tests_users

  has_many :test_passages
  has_many :users, through: :test_passages

  # validate :validate_bigger_then_zero

  validates :title, presence: true,
                    uniqueness: { scope: :level }
  validates :level, numericality: { only_integer: true, greater_than: 0 }

  scope :easy, -> { by_level(0..1) }
  scope :middle, -> { by_level(2..4) }
  scope :hard, -> { by_level(5..Float::INFINITY) }

  scope :by_level, ->(level) { where(level: level) }

  # def self.all_test_title_by_category(category_title)

  #   Test.joins("JOIN categories ON categories.id = tests.category_id")
  #       .where("categories.title = ?", category_title)
  #       .order('tests.title DESC')
  #       .pluck('tests.title')
  # end

  scope :by_category, ->(category) { joins(:category).where('categories.title = ?', category) }
  scope :desc, -> { order(title: :desc) }
  # scope :by_category_desc, ->(category) { by_category(category).desc }

  def self.titles_by_category(category_title)
    by_category(category_title).desc.pluck(:title)
  end

  def questions_count
    questions.count
  end

  # private

  # def validate_bigger_then_zero
  #   errors.add(:level) if level.to_i <= 0
  # end
end
