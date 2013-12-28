package hamming

func Distance(a, b string) int {
  return countDifferences(a, b, comparableLength(a, b))
}

func countDifferences(a, b string, length int) int {
  var differences = 0;
  for idx := 0; idx < length; idx++ {
    if a[idx] != b[idx] {
      differences++
    }
  }
  return differences
}

func comparableLength(a, b string) int {
  var shortest = len(a)
  if (len(b) < shortest) {
    shortest = len(b)
  }
  return shortest;
}