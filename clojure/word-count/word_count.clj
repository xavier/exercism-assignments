(ns phrase)
(require '[clojure.string :as string])

(defn- words [text]
  (re-seq #"\w+" text))

(defn- normalize [text]
  (string/lower-case text))

(defn word-count [text]
  (reduce (fn [counters word] (assoc counters word (inc (counters word 0))))
          {}
          (words (normalize text))))