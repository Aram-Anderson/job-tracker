feature "User creates a new contact" do
  scenario "visits company page and adds a contact" do
    company = Company.create(name: Faker::Company.name)
    visit company_path(company)
    name = Faker::Name.name
    position = Faker::Company.buzzword
    email = Faker::Internet.email

    fill_in "contact[name]", with: name
    fill_in "contact[position]", with: position
    fill_in "contact[email]", with: email
    click_on "Submit"

    expect(page).to have_content(name)
    expect(page).to have_content(position)
    expect(page).to have_content(email)
  end
end
