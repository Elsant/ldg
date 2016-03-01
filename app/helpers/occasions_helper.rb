module OccasionsHelper
  def occasion_styles_list
    @occasion_styles = Occasion.styles
  end
end
