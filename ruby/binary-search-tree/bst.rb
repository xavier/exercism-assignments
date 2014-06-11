
class Bst

  attr_reader :data, :left, :right

  def initialize(data)
    @data = data
  end

  def insert(new_data)
    if new_data <= @data
      @left  = insert_branch(@left, new_data)
    else
      @right = insert_branch(@right, new_data)
    end
  end

  def each(&block)
    left.each(&block) if left
    yield data
    right.each(&block) if right
  end

  private

  def insert_branch(branch, new_data)
    if branch
      branch.insert(new_data)
      branch
    else
      self.class.new(new_data)
    end
  end

end