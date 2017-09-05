describe "User sees one category" do
  scenario "a user sees a category" do
    company = Company.create!(name: "ESPN")
    category = Category.create(name: "Software")
    job = company.jobs.create!(title: "Developer", level_of_interest: 90, city: "Denver", category_id: category.id)
    job2 = company.jobs.create!(title: "Party Pants", level_of_interest: 90, city: "There", category_id: category.id)

    visit category_path(category)

    expect(current_path).to eq("/categories/#{category.id}")
    expect(page).to have_content("Software")
    expect(page).to have_content("Developer")
    expect(page).to have_content("Party Pants")
  end
end
