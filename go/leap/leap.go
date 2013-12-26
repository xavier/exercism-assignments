package leap

func IsLeapYear(year int) bool {
  return isDivisibleBy4(year) && (!isCentury(year) || isSpecial(year));
}

func isDivisibleBy4(year int) bool {
  return year % 4 == 0
}

func isCentury(year int) bool {
  return year % 100 == 0
}

func isSpecial(year int) bool {
  return year % 400 == 0
}