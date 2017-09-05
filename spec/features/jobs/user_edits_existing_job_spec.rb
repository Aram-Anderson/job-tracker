feature "User edits an existing job" do
  scenario "a user can edit a job" do
    company = Company.create!(name: "ESPN")
    category = Category.create(name: "Software")
    job = company.jobs.create!(title: "Developer", level_of_interest: 90, city: "Denver", category_id: category.id)

    visit company_jobs_path(company)

    expect(page).to have_content "ESPN"

    within(".jobs_#{job.id}") do
      click_on "Edit"
    end

    fill_in 'job[title]', with: "Drone"
    fill_in 'job[level_of_interest]', with: 34
    fill_in 'job[city]', with: "Here"
    select category.name, from: "job[category_id]"
    click_on "Update Job"


    expect(page).to have_content("Drone at ESPN was successfully updated!")
    expect(page).to_not have_content("Developer")
  end
end
