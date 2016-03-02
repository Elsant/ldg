require "test_helper"

feature "User Login " do

    let(:user) { User.create(
    firstname: "John",
    lastname: "Doe",
    phone: "+1-132-75523445",
    zipcode: 34567,
    email: "j.doe@example.com",  
    password: "password",
    confirmed_at: Time.now
    ) }

  scenario "unsigned user visits root page " do
    visit "/"
    page.must_have_content "Select Gender"
  end
  
  scenario "user signes in with correct email password " do
    login_as(user, :scope => :user)
    visit "/"
    page.must_have_content "Signed In"
  end

end
