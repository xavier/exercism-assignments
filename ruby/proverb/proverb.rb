class Proverb

  def initialize(*items, **options)
    @items     = items
    @qualifier = options[:qualifier]
  end

  def to_s
    proverb = ""
    each_item_pairs do |wanted_item, lost_item|
      proverb << line(wanted_item, lost_item)
    end
    proverb << last_line(@qualifier, @items.first, )
  end

  private

  def each_item_pairs
    (1...@items.count).each do |i|
      yield @items[i-1], @items[i]
    end
  end

  def line(wanted_item, lost_item)
    "For want of a #{wanted_item} the #{lost_item} was lost.\n"
  end

  def last_line(qualifier, wanted_item)
    qualified_item = "#{qualifier} #{wanted_item}".strip
    "And all for the want of a #{qualified_item}."
  end

end