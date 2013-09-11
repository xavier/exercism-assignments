class Phone

  REGEX_SANITIZE = /[^\d]/
  REGEX_PARTS    = /\A1?(\d{3})(\d{3})(\d{4})\Z/
  INVALID        = %w(000 0000 000)
  FORMAT         = "(%s) %s-%s"

  def initialize(number_string)
    @parts = parse(sanitize(number_string))
  end

  def number
    @parts.join
  end

  def area_code
    @parts.first
  end

  def to_s
    FORMAT % @parts
  end

  private

  def sanitize(number_string)
    number_string.gsub(REGEX_SANITIZE, "")
  end

  def parse(number_string)
    if REGEX_PARTS =~ number_string
      [$1, $2, $3]
    else
      INVALID
    end
  end

end