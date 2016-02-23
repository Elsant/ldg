require "test_helper"

describe Style do
  let(:style) { Style.new(
    gender_preference: 1,
    work_style: 1,
    evening_style: 1,     
    shirt_fit: 1,  
    pants_fit: 1 
    )}

  it "must be valid" do
    value(style).must_be :valid?
  end

  it "must have a gender_preference" do
    value(style.gender_preference).must_equal 1 
    value(style.gender_preference).must_be_instance_of Fixnum
  end

  it "must have a work_style" do
    value(style.work_style).must_equal 1 
    value(style.work_style).must_be_instance_of Fixnum
  end

  it "must have a evening_style" do
    value(style.evening_style).must_equal 1 
    value(style.evening_style).must_be_instance_of Fixnum
  end

  it "must have a shirt_fit" do
    value(style.shirt_fit).must_equal 1 
    value(style.shirt_fit).must_be_instance_of Fixnum
  end

  it "must have a pants_fit" do
    value(style.pants_fit).must_equal 1 
    value(style.pants_fit).must_be_instance_of Fixnum
  end

end

     