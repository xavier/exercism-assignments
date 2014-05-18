class Array
  def accumulate(&operation)
    self.reduce([]) { |result, item| result << operation.(item) }
  end
end