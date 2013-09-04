(ns etl)
(require '[clojure.string :as string])

(def transform-value-into-key string/lower-case)

(defn- transform-key-values [output [key values]]
  (reduce
    (fn [out value] (assoc out (transform-value-into-key value) key))
    output
    values))

(defn transform [input]
  (reduce transform-key-values {} input))