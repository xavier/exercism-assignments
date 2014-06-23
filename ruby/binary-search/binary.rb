
class BinarySearch

  attr_reader :list

  def initialize(list)
    @list = list
    raise ArgumentError unless list_sorted?
  end

  def search_for(item)
    lower_bound, upper_bound, found = 0, list.size.pred, nil
    while !found && (lower_bound < upper_bound) do
      pivot_index = (lower_bound + upper_bound) / 2
      pivot = list[pivot_index]
      if pivot == item
        found = pivot_index
      elsif pivot < item
        lower_bound = pivot_index.succ
      else
        upper_bound = pivot_index.pred
      end
    end
    found || (raise RuntimeError)
  end

  def middle
    list.size / 2
  end

  private

  def list_sorted?
    list.each_cons(2).all? { |a, b| a <= b }
  end

end