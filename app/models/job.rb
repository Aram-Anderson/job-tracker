class Job < ApplicationRecord
  validates :title, :level_of_interest, :city, presence: true
  has_many :comments, dependent: :destroy
  has_many :taggings
  has_many :tags, through: :taggings
  belongs_to :company
  belongs_to :category

  def self.sort_by_interest
    group(:level_of_interest).count
  end

  def self.by_city
    group(:city).count
  end
end
