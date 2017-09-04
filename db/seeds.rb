Company.destroy_all
Job.destroy_all
Category.destroy_all

COMPANIES = ["ESPN", "Aetna", "United Airlines", "Denver Public Schools", "Shopify", "Starbucks", "Pivotal Labs", "Captain U"]
JOBS = ["Engineering", "Development", "Dev Ops", "Quality Assurance", "Teacher", "Product Manager", "Consultant", "Community Manager"]
CITIES = ["Seattle", "Denver", "Portland", "Indianapolis", "Madison", "Orlando", "San Diego", "Austin", "Las Vegas", "Little Rock", "Boise", "Eugene", "Oakland"]
CATEGORIES = []

15.times do
  CATEGORIES << Category.create!(name: Faker::Zelda.character)
end

15.times do
  Tag.create(name: Faker::Hacker.ingverb)
end

COMPANIES.each do |name|
  company = Company.create!(name: name)
  puts "Created #{company.name}"
  10.times do |num|
    company.jobs.create!(title: JOBS.sample, description: Faker::Hacker.say_something_smart, level_of_interest: num + rand(100), city: CITIES.sample, category_id: CATEGORIES.sample.id)
    puts "  Created #{company.jobs[num].title}"
  end
end
