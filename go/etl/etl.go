package etl

import "strings";

func Transform(source map[int][]string) map[string]int {
  var transformed = make(map[string]int)
  for score, letters := range source {
    for _, letter := range letters {
      transformed[strings.ToLower(letter)] = score
    }
  }
  return transformed;
}
