
class CustomSet

  def initialize(collection = [])
    @set = Array(collection).sort.uniq
  end

  def elements
    @set
  end

  alias_method :to_list, :elements

  def size
    @set.count
  end

  def empty?
    @set.empty?
  end

  def member?(element)
    @set.any? { |e| e.eql?(element) }
  end

  def put(element)
    if member?(element)
      self
    else
      CustomSet.new(elements << element)
    end
  end

  def empty
    CustomSet.new
  end

  def delete(element)
    CustomSet.new(elements - [element])
  end

  def difference(other)
    CustomSet.new(elements - other.elements)
  end

  def intersection(other)
    CustomSet.new(elements & other.elements)
  end

  def union(other)
    CustomSet.new(elements | other.elements)
  end

  def subset?(other)
    other.intersection(self) == other
  end

  def disjoint?(other)
    intersection(other).empty?
  end

  def ==(other)
    self.elements == other.elements
  end

end