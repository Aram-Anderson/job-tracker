feature "User deletes existing job" do
  scenario "a user can delete a job" do
    company = Company.create!(name: "ESPN")
    category = Category.create(name: "Software")
    job = company.jobs.create!(title: "Developer", level_of_interest: 90, city: "Denver", category_id: category.id)

    visit company_jobs_path(company)

    within(".jobs_#{job.id}") do
      click_on "Delete"
    end

    expect(page).to have_content("Developer at ESPN was successfully deleted!")
  end
end
