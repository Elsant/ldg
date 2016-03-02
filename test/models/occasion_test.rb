require "test_helper"

describe Occasion do
  let(:user) { User.create(
    firstname: "John",
    lastname: "Doe",
    phone: "+1-132-75523445",
    zipcode: 34567,
    email: "j.doe@example.com",  
    password: "password"
    ) }

  let(:time_now) { Time.now}
  let(:future_day) { (time_now + 10.days).strftime("%m-%d-%Y %H:%M") }
  let(:archieved_day)  { time_now + 20.days }

  let(:occasion) { Occasion.create(
    user_id: user.id, 
    title: "Title",
    style: 1,
    occasion_time: future_day,
    archieved: archieved_day
    ) }


  it "must be valid" do
    value(occasion).must_be :valid?
  end

  it "must belong to user" do
    occasion.user.must_equal user
    occasion.user.id.must_equal user.id
  end

  it "must have title" do
    occasion.title.must_equal "Title"
    occasion.title.must_be_instance_of String
  end

  it "must have style" do
    occasion.style.must_equal 1
    occasion.style.must_be_instance_of Fixnum
  end

  it "must have named style" do
    occasion.named_style.must_equal "Business"
    occasion.named_style.must_be_instance_of String
  end

  it "must have occasion_time" do
    occasion.occasion_time.strftime("%m-%d-%Y %H:%M").must_equal future_day 
    value(occasion.occasion_time).must_be_instance_of ActiveSupport::TimeWithZone
  end

  it "must have occasion_time" do
    occasion.archieved.must_equal archieved_day
    occasion.archieved.must_be_instance_of ActiveSupport::TimeWithZone
  end

end
