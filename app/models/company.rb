class Company < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  has_many :jobs, dependent: :destroy
  has_many :contacts, dependent: :destroy

  def self.average_level_of_interest
    all_comps = Company.all.map do |company|
      [company.name, company.jobs.average(:level_of_interest)]
    end
    all_comps.sort_by do |comp|
      comp[1]
    end.reverse.take(3)
  end
end
