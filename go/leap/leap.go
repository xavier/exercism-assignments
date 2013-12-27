package leap

func IsLeapYear(year int) bool {
  return isExceptionalCentury(year) || (!isCentury(year) && isDivisibleBy4(year))
}

func isDivisibleBy4(year int) bool {
  return year % 4 == 0
}

func isCentury(year int) bool {
  return year % 100 == 0
}

func isExceptionalCentury(year int) bool {
  return year % 400 == 0
}