require "test_helper"

feature "User Login " do
  scenario "signs in with correct email password " do
    visit root_path
    # page.must_have_content "Hello World"
    # page.wont_have_content "Goobye All!"
  end

  # it "must have a slug" do
  #   user.save
  #   default_url_options['localhost:3000']
  #   user.slug.assert_equal "doe"
  #   user.slug.assert_be_instance_of String
  # end
end
