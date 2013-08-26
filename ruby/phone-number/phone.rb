class Phone

  LENGTH           = 10
  INVALID          = "0" * LENGTH
  REGEX_SANITIZE   = /[^\d]/
  REGEX_TRIM_1     = /\A1(\d{#{LENGTH}})\Z/
  REGEX_PARTS      = /(\d{3})(\d{3})(\d{4})/
  AREA_CODE_DIGITS = 0..2
  FORMAT           = "(%s) %s-%s"

  def initialize(number)
    @number = sanitize(number)
  end

  def number
    valid? ? @number : INVALID
  end

  def area_code
    @number[AREA_CODE_DIGITS]
  end

  def to_s
    @number =~ REGEX_PARTS
    FORMAT % [$1, $2, $3]
  end

  private

  def valid?
    @number.length == LENGTH
  end

  def sanitize(string)
    string.
      gsub(REGEX_SANITIZE, "").
      gsub(REGEX_TRIM_1, "\\1")
  end

end