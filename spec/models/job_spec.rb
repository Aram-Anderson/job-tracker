require 'rails_helper'

describe Job do
  describe "validations" do
    context "invalid attributes" do
      it "is invalid without a title" do
        company = Company.create!(name: "ESPN")
        category = Category.create(name: "Software")
        job = company.jobs.new(level_of_interest: 90, city: "Denver", category_id: category.id)
        expect(job).to be_invalid
      end

      it "is invalid without a level of interest" do
        company = Company.create!(name: "ESPN")
        category = Category.create(name: "Software")
        job = company.jobs.new(title: "Developer", city: "Denver", category_id: category.id)
      end

      it "is invalid without a city" do
        company = Company.create!(name: "ESPN")
        category = Category.create(name: "Software")
        job = company.jobs.new(title: "Developer", level_of_interest: 90, category_id: category.id)
        expect(job).to be_invalid
      end
    end

    context "valid attributes" do
      it "is valid with a title, level of interest, and company" do
        company = Company.create!(name: "ESPN")
        category = Category.create(name: "Software")
        job = company.jobs.new(title: "Developer", level_of_interest: 90, city: "Denver", category_id: category.id)
        expect(job).to be_valid
      end
    end
  end

  describe "relationships" do
    it "belongs to a company" do
      company = Company.create!(name: "ESPN")
      category = Category.create(name: "Software")
      job = company.jobs.create!(title: "Developer", level_of_interest: 90, city: "Denver", category_id: category.id)
      expect(job).to respond_to(:company)
    end
  end
end
