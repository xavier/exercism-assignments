
class Bst

  attr_reader :data, :left, :right

  def initialize(data)
    @data = data
  end

  def insert(new_data)
    if new_data <= @data
      insert_subtree(:left, new_data)
    else
      insert_subtree(:right, new_data)
    end
  end

  def each(&block)
    left.each(&block) if left
    yield data
    right.each(&block) if right
  end

  private

  def insert_subtree(branch_name, new_data)
    subtree = branch(branch_name)
    if subtree
      subtree.insert(new_data)
    else
      set_branch(branch_name, self.class.new(new_data))
    end
  end

  def branch(branch_name)
    self.send(branch_name)
  end

  def set_branch(branch_name, subtree)
    instance_variable_set("@#{branch_name}", subtree)
  end

end