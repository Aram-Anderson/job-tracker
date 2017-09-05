RSpec.describe Tag, type: :model do
  describe "attributes" do
    it "has a name" do
      tag = Tag.create(name: Faker::Hacker.ingverb)

      expect(tag).to respond_to(:name)
    end
  end

  context "validations" do
    it { is_expected.to validate_presence_of(:name)}
    it { is_expected.to validate_uniqueness_of(:name)}
  end

end
