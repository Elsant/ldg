require "test_helper"

describe FavStore do
  let(:fav_store) { FavStore.new(
      store: [1,2,5,8]
    )}

  it "must be valid" do
    value(fav_store).must_be :valid?
  end

  it "must have a favorite store - Array of indexes" do
    value(fav_store.store).must_equal [1,2,5,8]
    value(fav_store.store).must_be_instance_of Array
  end

  it "must have a favorite store - Array of strings" do
    value(fav_store.stores).must_equal ["Express", "H&M", "Gilt", "Macy's"]
    value(fav_store.stores).must_be_instance_of Array
  end

  it "must have a favorite store - Array of strings" do
    fav_store.save!
    value(fav_store.stores).must_equal ["Express", "H&M", "Gilt", "Macy's"]
    value(fav_store.stores).must_be_instance_of Array
  end

end
