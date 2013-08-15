(ns anagram)
(require '[clojure.string :as string])

(defn- comparable [word]
  (frequencies (string/lower-case word)))

(defn- anagram-matcher [word]
  (let [comparable-word (comparable word)]
    #(= comparable-word (comparable %1))))

(defn anagrams-for [word candidates]
  (filter (anagram-matcher word) candidates))
