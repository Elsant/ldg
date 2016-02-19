class Sizeset < ActiveRecord::Base
  belongs_to :user

  SHIRT_SIZES = %w/ X-Small Small Medium Large X-Large XX-Large XXX-Large /.freeze

  NECK_SIZES =  ["XXS / 14.25 inches / 36 cm", "XS / 14.5 inches / 37 cm", "S / 15 inches / 38 cm", "M / 16 inches / 41 cm", "L / 17 inches / 43 cm", "XL / 17.5 inches / 44 cm", "XXL / 18 inches / 46 cm"].freeze

  JACKET_SIZES =  ["XXS / 14.25 inches / 36 cm", "XS / 14.5 inches / 37 cm", "S / 15 inches / 38 cm", "M / 16 inches / 41 cm", "L / 17 inches / 43 cm", "XL / 17.5 inches / 44 cm", "XXL / 18 inches / 46 cm"].freeze

  WAIST_SIZES =  ["XXS / 14.25 inches / 36 cm", "XS / 14.5 inches / 37 cm", "S / 15 inches / 38 cm", "M / 16 inches / 41 cm", "L / 17 inches / 43 cm", "XL / 17.5 inches / 44 cm", "XXL / 18 inches / 46 cm"].freeze

  SHOES_SIZES = [6, 6.5, 7, 7.5, 8, 8.5, 9, 9.5, 10, 10.5, 11, 11.5, 12, 12.5, 13, 13.5, 14].freeze

  HEIGHT_SIZES = ["5'0\"", "5'1\"", "5'2\"", "5'3\"", "5'4\"", "5'5\"", "5'6\"", "5'7\"", "5'8\"", "5'9\"", "5'10\"", "5'11\"", "6'0\"", "6'1\"", "6'2\"", "6'3\"", "6'4\"", "6'5\"", "6'6\"", "6'7\"", "6'8\"", "6'9\"", "6'10\"", "6'11\""].freeze
  
  WEIGHT_SIZES = ["120 lbs", "125 lbs", "130 lbs", "135 lbs", "140 lbs", "145 lbs", "150 lbs", "155 lbs", "160 lbs", "165 lbs", "170 lbs", "175 lbs", "180 lbs", "185 lbs", "190 lbs", "195 lbs", "200 lbs", "205 lbs", "210 lbs", "215 lbs", "220 lbs", "225 lbs", "230 lbs", "235 lbs", "240 lbs", "245 lbs", "250 lbs", "255 lbs", "260 lbs", "265 lbs"].freeze


  def self.shirt_sizes
    SHIRT_SIZES.dup
  end

  def self.neck_sizes
    NECK_SIZES.dup
  end

  def self.jacket_sizes
    JACKET_SIZES.dup
  end

  def self.waist_sizes
    WAIST_SIZES.dup
  end

  def self.shoe_sizes
    SHOES_SIZES.dup
  end

  def self.height_sizes
    HEIGHT_SIZES.dup
  end

  def self.weight_sizes
    WEIGHT_SIZES.dup
  end




  def shirt_size
    SHIRT_SIZES[self.shirt] if self.shirt
  end

  def neck_size
    NECK_SIZES[self.neck] if self.neck
  end

  def jacket_size
    JACKET_SIZES[self.jacket] if self.jacket
  end

  def waist_size
    WAIST_SIZES[self.waist] if self.waist
  end

  def shoe_size
    SHOES_SIZES[self.shoe] if self.shoe
  end
  
  def height_size
    HEIGHT_SIZES[self.height] if self.height
  end

  def weight_size
    WEIGHT_SIZES[self.weight] if self.weight
  end
end
