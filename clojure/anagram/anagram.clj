(ns anagram)
(require '[clojure.string :as string])

(defn- comparable [word]
  (frequencies (string/lower-case word)))

(defn- anagram-matcher [word]
  (let [comparable-word (comparable word)]
    (fn [other-word]
      (= comparable-word (comparable other-word)))))

(defn anagrams-for [word candidates]
  (filter (anagram-matcher word) candidates))
