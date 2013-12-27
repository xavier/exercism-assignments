package leap

func IsLeapYear(year int) bool {
  return isDivisibleBy4(year) && (!isCentury(year) || isExceptionalCentury(year));
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