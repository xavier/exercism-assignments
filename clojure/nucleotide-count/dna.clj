(ns dna)
(require '[clojure.string :as string])
(use '[clojure.set :only [union]])

(def common-nucleotides #{"A" "C" "G"})
(def dna-nucleotides (conj common-nucleotides "T"))
(def rna-nucleotides (conj common-nucleotides "U"))
(def countable-nucleotides (union dna-nucleotides rna-nucleotides))
(def default-nucleotide-counts (reduce #(assoc %1 %2 0) {} dna-nucleotides))

(defn- nucleotides [sequence]
  (map str sequence))

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