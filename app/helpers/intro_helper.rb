module IntroHelper

  def options_for_shirt_sizes
    arr = Sizeset.shirt_sizes.each_with_index.map { |x,i| [x, i] }
    arr << ["I don't know my shirt size", nil]
    result = options_for_select(arr)
  end

  def options_for_neck_sizes
    arr = Sizeset.neck_sizes.each_with_index.map { |x,i| [x, i] }
    arr << ["I don't know my neck size", nil]
    result = options_for_select(arr)
  end

  def options_for_jacket_sizes
    arr = Sizeset.jacket_sizes.each_with_index.map { |x,i| [x, i] }
    arr << ["I don't know my jacket size", nil]
    result = options_for_select(arr)
  end

  def options_for_waist_sizes
    arr = Sizeset.waist_sizes.each_with_index.map { |x,i| [x, i] }
    arr << ["I don't know my waist size", nil]
    result = options_for_select(arr)
  end

  def options_for_shoe_sizes
    arr = Sizeset.shoe_sizes.each_with_index.map { |x,i| [x, i] }
    arr << ["I don't know my shoes size", nil]
    result = options_for_select(arr)
  end

  def options_for_height_sizes
    arr = Sizeset.height_sizes.each_with_index.map { |x,i| [x, i] }
    arr << ["I don't know my height size", nil]
    result = options_for_select(arr)
  end

  def options_for_weight_sizes
    arr = Sizeset.weight_sizes.each_with_index.map { |x,i| [x, i] }
    arr << ["I don't know my weight size", nil]
    result = options_for_select(arr)
  end

end
