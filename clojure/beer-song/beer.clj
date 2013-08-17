(ns beer)
(require '[clojure.string :as string])

(def separator "\n")

(defn- n-bottles [bottles-count]
  (cond (= bottles-count 0) "no more bottles"
        (= bottles-count 1) "1 bottle"
        :else (format "%d bottles" bottles-count)))

(defn- take-what [count]
  (if (= count 1) "it" "one"))

(defn- line1 [bottles]
  (let [formatted-bottles (n-bottles bottles)]
    (format "%s of beer on the wall, %s of beer." (string/capitalize formatted-bottles) formatted-bottles)))

(defn- line2 [bottles]
  (if (> bottles 0)
    (format "Take %s down and pass it around, %s of beer on the wall." (take-what bottles) (n-bottles (dec bottles)))
    "Go to the store and buy some more, 99 bottles of beer on the wall."))

(defn- assemble [parts]
  (str (string/join separator parts) separator))

(defn- bottles-range [bottles_available bottles_left]
  (range bottles_available (dec bottles_left) -1))

(defn verse [bottles]
  (assemble [(line1 bottles) (line2 bottles)]))

(defn sing
  ([bottles_available] (sing bottles_available 0))
  ([bottles_available bottles_left]
    (assemble (map verse (bottles-range bottles_available bottles_left)))))