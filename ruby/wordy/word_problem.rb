
require 'strscan'

class StrictStringScanner < StringScanner

  def scan!(pattern)
    token = scan(pattern)
    raise ArgumentError unless token
    token
  end

end

class WordProblem

  class CalculationState

    attr_reader :state, :answer, :operation

    def initialize(state, answer, operation)
      @state, @answer, @operation = state, answer, operation
    end

  end

  class StateTransition

    attr_reader :expected_token

    def initialize(expected_token)
      @expected_token = expected_token
    end

    def update(calculation, token)
      raise NotImplemented
    end

  end

  class OnFirstNumber < StateTransition

    def initialize
      super(:number)
    end

    def update(calculation, token)
      CalculationState.new(:operation, token.to_i, nil)
    end

  end

  class OnNumber < StateTransition

    def initialize
      super(:number)
    end

    def update(calculation, token)
      CalculationState.new(:operation, calculation.operation.(calculation.answer, token.to_i), nil)
    end

  end

  class OnOperation < StateTransition

    def initialize
      super(:operation)
    end

    def update(calculation, token)
      if token =~ /raised to the (\d+)/
        raise_to_nth_power(calculation, $1.to_i)
      else
        arithmetic_operation(calculation, token)
      end
    end

    private

    def raise_to_nth_power(calculation, n)
      CalculationState.new(:operation, calculation.answer ** n, nil)
    end

    def arithmetic_operation(calculation, token)
      CalculationState.new(:number, calculation.answer, operation_for(token))
    end

    def operation_for(token)
      case token
        when "plus"          then -> (answer, x) { answer + x }
        when "minus"         then -> (answer, x) { answer - x }
        when "multiplied by" then -> (answer, x) { answer * x }
        when "divided by"    then -> (answer, x) { answer / x }
      end
    end

  end

  TOKENS = {
    :spaces       => /\s+/,
    :first_number => /-?\d+/,
    :number       => /-?\d+/,
    :operation    => /plus|minus|multiplied by|divided by|raised to the \d+(st|nd|th) power/,
  }

  STATE_TRANSITIONS = {
    :first_number => OnFirstNumber.new,
    :operation    => OnOperation.new,
    :number       => OnNumber.new,
  }

  def initialize(question)
    @question = question
  end

  def answer
    calculation = CalculationState.new(:first_number, nil, nil)
    scan_question do |scanner|
      state_transition_for calculation do |transition|
        token = scanner.scan!(TOKENS[transition.expected_token])
        calculation = transition.update(calculation, token)
      end
    end
    calculation.answer
  end

  private

  def state_transition_for(calculation)
    yield STATE_TRANSITIONS[calculation.state]
  end

  def scan_question
    scanner = StrictStringScanner.new(sanitize(@question))
    while not scanner.eos?
      scanner.skip(TOKENS[:spaces])
      yield scanner
    end
  end

  def sanitize(question)
    question.
      gsub(/^What is/, "").
      gsub(/\?$/, "")
  end

end