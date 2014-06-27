
class CustomSet

  def initialize(collection = [])
    @set = collection.each_with_object({}) { |item, h| h[item] = true }
  end

  def to_list
    @set.keys
  end

  def size
    @set.count
  end

  def empty?
    @set.empty?
  end

  def member?(element)
    @set.has_key?(element)
  end

  def put(element)
    if member?(element)
      self
    else
      CustomSet.new(to_list << element)
    end
  end

  def empty
    CustomSet.new
  end

  def delete(element)
    CustomSet.new(to_list - [element])
  end

  def difference(other)
    CustomSet.new(to_list - other.to_list)
  end

  def intersection(other)
    CustomSet.new(to_list & other.to_list)
  end

  def union(other)
    CustomSet.new(to_list | other.to_list)
  end

  def subset?(other)
    other.intersection(self) == other
  end

  def disjoint?(other)
    intersection(other).empty?
  end

  def ==(other)
    self.to_list.sort == other.to_list.sort
  end

end