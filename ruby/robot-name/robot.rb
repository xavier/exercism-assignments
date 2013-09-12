module RobotFactory

  module Tools

    def self.range_sampler(range)
      array = range.to_a
      ->() { array.sample }
    end

  end

  module Name

    RANDOM_LETTER = RobotFactory::Tools.range_sampler('A'..'Z')
    RANDOM_DIGIT  = RobotFactory::Tools.range_sampler('0'..'9')

    NAME_PATTERN = [RANDOM_LETTER] * 2 + [RANDOM_DIGIT] * 3

    def self.generate
      NAME_PATTERN.map { |random_component| random_component.() }.join
    end

  end

end

class Robot

  def name
    @name ||= RobotFactory::Name.generate
  end

  def reset
    @name = nil
  end

end