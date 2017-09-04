feature "User creates a new category" do
  scenario "can create a new category" do
    name = Faker::Hacker.ingverb
    visit new_category_path

    fill_in 'category[name]', with: name
    click_button 'Create Category'

    expect(page).to have_content name

  end
end
