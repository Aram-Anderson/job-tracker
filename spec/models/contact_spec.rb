RSpec.describe Contact, type: :model do
  describe "attributes" do
    it "has a name" do
      company = Company.create(name: Faker::Hacker.ingverb)
      contact = company.contacts.new(name: Faker::Name.name, position: Faker::Hacker.verb, email: Faker::Internet.email)
      expect(contact).to respond_to(:name)
      expect(contact).to respond_to(:position)
      expect(contact).to respond_to(:email)
    end
  end

  context "validations" do
    it { is_expected.to validate_presence_of(:name)}
    it { is_expected.to validate_presence_of(:position)}
    it { is_expected.to validate_presence_of(:email)}
  end
end
