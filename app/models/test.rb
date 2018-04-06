class Test < ApplicationRecord
  has_many :questions
  belongs_to :category

  belongs_to :author, class_name: 'User', foreign_key: 'user_id'

  has_many :test_passages
  has_many :users, through: :test_passages

  validates :title, presence: true,
                    uniqueness: { scope: :level }
  validates :level, numericality: { only_integer: true, greater_than: 0 }
  validates :timer, numericality: { only_integer: true, greater_than: 0 }

  scope :easy, -> { by_level(0..1) }
  scope :middle, -> { by_level(2..4) }
  scope :hard, -> { by_level(5..Float::INFINITY) }

  scope :by_level, ->(level) { where(level: level) }

  scope :by_category, ->(category) { joins(:category).where('categories.title = ?', category) }
  scope :desc, -> { order(title: :desc) }

  def self.titles_by_category(category_title)
    by_category(category_title).desc.pluck(:title)
  end

  def questions_count
    questions.count
  end
end
