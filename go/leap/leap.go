package leap

func IsLeapYear(year int) bool {
  return isDivisible(year, 400) || (!isDivisible(year, 100) && isDivisible(year, 4))
}

func isDivisible(year int, divider int) bool {
  return year % divider == 0
}