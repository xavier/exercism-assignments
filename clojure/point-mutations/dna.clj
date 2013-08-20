(ns dna)
(require '[clojure.string :as string])

(defn- hamming-distance-increment [n1 n2]
  (if (= n1 n2) 0 1))

(defn hamming-distance [strand1 strand2]
  (reduce + (map hamming-distance-increment strand1 strand2)))
