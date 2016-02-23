class FavStore < ActiveRecord::Base
  belongs_to :user

  STORES = ["Nordstrom",  "Express",  "H&M", "Banana Republic", "Saks Fifth Avenue", "Gilt", "Urban Outfitters", "J.Crew", "Macy's", "Gap", "Neiman Marcus"].freeze

  def self.stores
    STORES.dup
  end

  def store
    super && super.split(":").map(&:to_i)
  end

  def store=(arr)
    arr && super(arr.join(":")) 
  end

  def stores
    if self.store
      arr = []
      self.store.each do |i|
        arr << STORES[i]
      end
      arr
    else
      nil
    end
  end

end
