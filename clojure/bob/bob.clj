(ns bob)
(require '[clojure.string :as string])

(defn- silence? [sentence]
  (string/blank? sentence))

(defn- shouting? [sentence]
  (= sentence (string/upper-case sentence)))

(defn- question? [sentence]
  (= \? (last sentence)))

(defn response-for [sentence]
  (cond
    (silence? sentence) "Fine, be that way."
    (shouting? sentence) "Woah, chill out!"
    (question? sentence) "Sure."
    :else "Whatever."
  )
)
