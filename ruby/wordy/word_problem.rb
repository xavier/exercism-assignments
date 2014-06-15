
require 'strscan'

class WordProblem

  class CalculationState

    attr_reader :state, :answer, :operation

    def initialize(state, answer, operation)
      @state, @answer, @operation = state, answer, operation
    end

  end

  class StateTransition

    attr_reader :on_token

    def initialize(on_token)
      @on_token = on_token
    end

    def update(calculation, token)
      raise NotImplemented
    end

  end

  class FirstNumberState < StateTransition

    def initialize
      super(:number)
    end

    def update(calculation, token)
      CalculationState.new(:operation, token.to_i, nil)
    end

  end

  class NumberState < StateTransition

    def initialize
      super(:number)
    end

    def update(calculation, token)
      CalculationState.new(:operation, calculation.operation.(calculation.answer, token.to_i), nil)
    end

  end

  class OperationState < StateTransition

    OPERATIONS = {
      "plus"          => -> (answer, x) { answer + x },
      "minus"         => -> (answer, x) { answer - x },
      "multiplied by" => -> (answer, x) { answer * x },
      "divided by"    => -> (answer, x) { answer / x },
    }

    def initialize
      super(:operation)
    end

    def update(calculation, token)
      CalculationState.new(:number, calculation.answer, OPERATIONS[token])
    end

  end

  TOKENS = {
    :spaces       => /\s+/,
    :first_number => /-?\d+/,
    :number       => /-?\d+/,
    :operation    => /plus|minus|multiplied by|divided by/,
  }

  STATE_TRANSITIONS = {
    :first_number => FirstNumberState.new,
    :operation    => OperationState.new,
    :number       => NumberState.new,
  }

  def initialize(question)
    @question = sanitize(question)
  end

  def answer
    scanner = StringScanner.new(@question)
    calculation = CalculationState.new(:first_number, nil, nil)
    while not scanner.eos?
      scanner.skip(TOKENS[:spaces])
      state_transition = STATE_TRANSITIONS[calculation.state]
      token = scanner.scan(TOKENS[state_transition.on_token])
      raise ArgumentError if token.nil?
      calculation = state_transition.update(calculation, token)
    end
    calculation.answer
  end

  private

  def sanitize(question)
    question.gsub("What is", "").gsub(/\?$/, "").gsub(/\s+/, " ")
  end

end