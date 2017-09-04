FactoryGirl.define do
  factory :company do
    name { Faker::Hacker.ingverb }
  end
end
