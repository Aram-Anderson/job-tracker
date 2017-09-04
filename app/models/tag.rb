class Tag < ApplicationRecord
  validates :name, presence: true, uniqueness: true

  has_many :taggings
  has_many :jobs, through: :taggings
end
