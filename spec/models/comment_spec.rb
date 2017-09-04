require 'rails_helper'

RSpec.describe Comment, type: :model do
  describe "attributes" do
    it "has a name" do
      company = Company.create!(name: Faker::Company.name)
      category = Category.create!(name: Faker::Company.profession)
      job = company.jobs.create(title: "Developer", level_of_interest: 90, city: "Denver", category_id: category.id)
      comment = job.comments.create(body: Faker::Hacker.say_something_smart)

      expect(comment).to respond_to(:body)
    end
  end

  context "validations" do
    it { is_expected.to validate_presence_of(:body)}
  end

end
