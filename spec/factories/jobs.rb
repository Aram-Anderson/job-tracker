FactoryGirl.define do
  factory :job do
    title { Faker::Hacker.ingverb }
    description { Faker::Hacker.say_something_smart }
    level_of_interest { Faker::Number.number(3) }
    city { Faker::Space.constellation }
  end
end
