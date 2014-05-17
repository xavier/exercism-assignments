class SpaceAge

  EARTH_ORBITAL_PERIOD_SECONDS = 31557600.0

  ORBITAL_PERIODS = {
    :earth   => 1,
    :mercury => 0.2408467,
    :venus   => 0.61519726,
    :mars    => 1.8808158,
    :jupiter => 11.862615,
    :saturn  => 29.447498,
    :uranus  => 84.016846,
    :neptune => 164.79132,
  }

  ROUNDING = 2

  attr_reader :seconds

  def initialize(seconds)
    @seconds = seconds
  end

  ORBITAL_PERIODS.each do |planet, factor|

    define_method "on_#{planet}" do
      (calculate_age_on_earth / factor).round(ROUNDING)
    end

  end

  private

  def calculate_age_on_earth
    (@seconds / EARTH_ORBITAL_PERIOD_SECONDS)
  end

end