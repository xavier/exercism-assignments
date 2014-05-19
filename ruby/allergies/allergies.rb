class Allergies

  VALUES = {
    'eggs'         => 1,
    'peanuts'      => 1<<1,
    'shellfish'    => 1<<2,
    'strawberries' => 1<<3,
    'tomatoes'     => 1<<4,
    'chocolate'    => 1<<5,
    'pollen'       => 1<<6,
    'cats'         => 1<<7,
  }

  def initialize(score)
    @score = score
  end

  def allergic_to?(item)
    @score & VALUES[item] != 0
  end

  def list
    VALUES.keys.select { |item| allergic_to?(item) }
  end

end