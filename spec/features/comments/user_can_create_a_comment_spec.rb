feature "User creates a new comment" do
  scenario "user visits the job page and creates a new comment" do
    company = Company.create!(name: Faker::Company.name)
    category = Category.create!(name: Faker::Company.profession)
    job = company.jobs.create(title: "Developer", level_of_interest: 90, city: "Denver", category_id: category.id)
    body = Faker::Hacker.say_something_smart

    visit company_job_path(company, job)

    fill_in "comment[body]", with: body
    click_on "Submit"

    expect(page).to have_content body


  end
end
