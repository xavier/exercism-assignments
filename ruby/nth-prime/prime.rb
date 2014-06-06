
require 'prime'

class Prime

  def nth(n)
    raise ArgumentError if n.zero?
    self.first(n).last
  end

end