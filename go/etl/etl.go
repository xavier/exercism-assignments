package etl

import "strings";

func Transform(source map[int][]string) map[string]int {
  var target = make(map[string]int)
  for score, letters := range source {
    for _, letter := range letters {
      target[strings.ToLower(letter)] = score
    }
  }
  return target;
}
