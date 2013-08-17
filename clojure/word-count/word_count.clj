(ns phrase)
(require '[clojure.string :as string])

(defn- words [text]
  (re-seq #"\w+" text))

(defn- normalize [text]
  (string/lower-case text))

(defn word-count [text]
  (-> text
      normalize
      words
      frequencies))