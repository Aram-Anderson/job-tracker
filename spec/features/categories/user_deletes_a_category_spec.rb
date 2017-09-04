describe "User deletes existing company" do
  scenario "a user can delete a company" do
    category = Category.create(name: "ESPN")
    visit categories_path

    within(".category_#{category.id}") do

      click_on "Delete"
    end

    expect(page).to have_content("category was successfully deleted!")
    expect(page).to_not have_content("ESPN")
  end
end
