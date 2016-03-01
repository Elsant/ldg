require "test_helper"

describe Occasion do
  let(:occasion) { Occasion.new }

  it "must be valid" do
    value(occasion).must_be :valid?
  end
end
