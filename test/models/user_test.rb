require "test_helper"

describe User do
  let(:user) { User.new(
    firstname: "John",
    lastname: "Doe",
    phone: "+1-132-75523445",
    zipcode: 34567,
    email: "j.doe@example.com",  
    password: "password"
    ) }

  it "must be valid" do
    value(user).must_be :valid?
  end

  it "must have a firstname" do
    value(user.firstname).must_equal "John" 
    value(user.firstname).must_be_instance_of String
  end

  it "must have a lastname" do
    value(user.lastname).must_equal "Doe" 
    value(user.lastname).must_be_instance_of String
  end

  it "must have a phone" do
    value(user.phone).must_equal "+1-132-75523445" 
    value(user.phone).must_be_instance_of String
  end

  it "must have a zipcode" do
    value(user.zipcode).must_equal "34567" 
    value(user.zipcode).must_be_instance_of String
  end
  it "must have a email" do
    value(user.email).must_equal "j.doe@example.com" 
    value(user.email).must_be_instance_of String
  end

  it "must have a fullname" do
    value(user.fullname).must_equal "John Doe"
    value(user.fullname).must_be_instance_of String
  end

  it "must have first part of email as slug candidate" do
    value(user.halfemail).must_equal "jdoe"
    value(user.halfemail).must_be_instance_of String
  end

end

