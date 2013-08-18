(ns dna)
(require '[clojure.string :as string])

(def countable-nucleotides #{"A" "C" "G" "T" "U"})
(def default-nucleotide-counts {"A" 0, "C" 0, "G" 0, "T" 0})

(defn- nucleotides [sequence]
  (re-seq #"." sequence))

(defn- countable-nucleotide? [nucleotide]
  (contains? countable-nucleotides nucleotide))

(defn- nucleotide-counter [nucleotide]
  #(if (= %2 nucleotide) (inc %1) %1))

(defn count [nucleotide sequence]
  (if (countable-nucleotide? nucleotide)
    (reduce (nucleotide-counter nucleotide) 0 (nucleotides sequence))
    (throw (Exception. "invalid nucleotide"))))

(defn nucleotide-counts [sequence]
  (merge default-nucleotide-counts (frequencies (nucleotides sequence))))