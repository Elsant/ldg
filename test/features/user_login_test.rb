require "test_helper"

feature "User Login " do
  scenario "signs in with correct email password " do
    visit root_path
    # page.must_have_content "Hello World"
    # page.wont_have_content "Goobye All!"
  end

end
