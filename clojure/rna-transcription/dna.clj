(ns dna)

(def thymidine "T")
(def uracil "U")

(def transcribe clojure.string/replace)

(defn to-rna [sequence]
  (transcribe sequence thymidine uracil))