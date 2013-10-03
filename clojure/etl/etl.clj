(ns etl)
(require '[clojure.string :as string])

(def transform-value-into-key string/lower-case)

(defn- make-key-value-transformer [key-to-turn-into-value]
  (fn [output value] (assoc output (transform-value-into-key value) key-to-turn-into-value)))

(defn- transform-key-values [output key values]
  (reduce
    (make-key-value-transformer key)
    output
    values))

(defn transform [input]
  (reduce-kv transform-key-values {} input))