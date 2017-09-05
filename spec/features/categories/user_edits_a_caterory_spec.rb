describe "User edits an existing category" do
  scenario "a user can edit a category" do
    category = Category.create!(name: "Party")
    name = Faker::Hacker.ingverb
    visit edit_category_path(category)

    fill_in "category[name]", with: name
    click_button "Update"

    expect(current_path).to eq("/categories/#{Category.last.id}")
    expect(page).to have_content(name)
    expect(page).to_not have_content("Party")
  end
end
