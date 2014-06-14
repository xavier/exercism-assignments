
class Element

  attr_reader :datum, :next

  def initialize(datum, next_element)
    @datum, @next = datum, next_element
  end

  def reverse
    if @next
     Element.new(@next.datum, Element.new(self.datum, @next.reverse))
    else
      self
    end
  end

  def to_a
    self.class.to_a(self)
  end

  class <<self

    def to_a(element)
      if element
        [element.datum] + to_a(element.next)
      else
        []
      end
    end

    def from_a(array)
      Array(array).reverse.reduce(nil) do |next_element, datum|
        Element.new(datum, next_element)
      end
    end

  end

end