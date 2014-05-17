class Array

  def keep(&predicate)
    reduce([]) do |list, element|
      predicate.(element) ? list << element : list
    end
  end

  def discard(&predicate)
    keep { |element| !predicate.(element) }
  end

end