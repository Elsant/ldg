require 'test_helper'

describe Sizeset do
  let(:sizeset) { Sizeset.new(
    shirt: 4,
    neck: 3,
    jacket: 2,
    waist: 4,
    shoe: 8,
    height: 6,
    weight: 8
    )}

  it "must be valid" do
    value(sizeset).must_be :valid?
  end

  it "must have a shirt size" do
    value(sizeset.shirt).must_equal 4
    value(sizeset.shirt).must_be_instance_of Fixnum
  end

  it "must have a neck size" do
    value(sizeset.neck).must_equal 3
    value(sizeset.neck).must_be_instance_of Fixnum
  end

  it "must have a jacket size" do
    value(sizeset.jacket).must_equal 2
    value(sizeset.jacket).must_be_instance_of Fixnum
  end

  it "must have a waist size" do
    value(sizeset.waist).must_equal 4
    value(sizeset.waist).must_be_instance_of Fixnum
  end

  it "must have a shoe size" do
    value(sizeset.shoe).must_equal 8
    value(sizeset.shoe).must_be_instance_of BigDecimal
  end

  it "must have a height size" do
    value(sizeset.height).must_equal 6
    value(sizeset.height).must_be_instance_of Fixnum
  end

  it "must have a weight size" do
    value(sizeset.weight).must_equal 8
    value(sizeset.weight).must_be_instance_of Fixnum
  end


  it "must have a shirt size name" do
    value(sizeset.shirt_size).must_equal "X-Large"
    value(sizeset.shirt_size).must_be_instance_of String
  end

  it "must have a neck size name" do
    value(sizeset.neck_size).must_equal "M / 16 inches / 41 cm"
    value(sizeset.neck_size).must_be_instance_of String
  end

  it "must have a jacket size name" do
    value(sizeset.jacket_size).must_equal "S / 15 inches / 38 cm"
    value(sizeset.jacket_size).must_be_instance_of String
  end

  it "must have a waist size name" do
    value(sizeset.waist_size).must_equal "32 inches / 81 cm"
    value(sizeset.waist_size).must_be_instance_of String
  end

  it "must have a shoe size name" do
    value(sizeset.shoe_size).must_equal 10
    value(sizeset.shoe_size).must_be_instance_of Fixnum
  end

  it "must have a height as name" do
    value(sizeset.height_size).must_equal "5'6\""
    value(sizeset.height_size).must_be_instance_of String
  end

  it "must have a weight as name" do
    value(sizeset.weight_size).must_equal "160 lbs"
    value(sizeset.weight_size).must_be_instance_of String
  end

end
