class Occasion < ActiveRecord::Base
  belongs_to :user

  STYLES = %w/ Casual Business Formal /.freeze

  def self.styles
    STYLES.dup
  end

  def named_style
    STYLES[self.style] if self.style
  end

  def occasion_time=(value)
    self[:occasion_time] = DateTime.strptime(value, "%m-%d-%Y %H:%M").to_time
  end

end
