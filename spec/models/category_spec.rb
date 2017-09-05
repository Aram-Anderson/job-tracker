RSpec.describe Category, type: :model do
  describe "attributes" do
    it "has a name" do
      category = Category.new(name: Faker::Name.name)

      expect(category).to respond_to(:name)
    end
  end

  context "validations" do
    it { is_expected.to validate_presence_of(:name)}
    it { is_expected.to validate_uniqueness_of(:name)}
  end
end
