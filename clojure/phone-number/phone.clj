(ns phone)
(require '[clojure.string :as string])

(def invalid-number "0000000000")
(def area-code-length 3)
(def number-length 10)
(def regex-invalid-characters #"[^\d]")
(def regex-valid-10-digits-number #"^\d{10}$")
(def regex-valid-11-digits-number #"^1\d{10}$")
(def regex-parse-groups #"(\d{3})(\d{3})(\d{4})")
(def pretty-print-format "(%s) %s-%s")

(defn- sanitize [phone-number]
  (string/replace phone-number regex-invalid-characters ""))

(defn- valid-10-digits-number? [sanitized-phone-number]
  (re-matches regex-valid-10-digits-number sanitized-phone-number))

(defn- valid-11-digits-number? [sanitized-phone-number]
  (re-matches regex-valid-11-digits-number sanitized-phone-number))

(defn- strip-leading-digit [phone-number]
  (subs phone-number 1 (inc number-length)))

(defn- normalize [sanitized-phone-number]
  (cond
    (valid-10-digits-number? sanitized-phone-number)
      sanitized-phone-number
    (valid-11-digits-number? sanitized-phone-number)
      (strip-leading-digit sanitized-phone-number)
    :else
      invalid-number))

;; I have no idea why re-groups doesn't work here
(defn- parse-groups [phone-number]
  (rest (re-find (re-matcher regex-parse-groups phone-number))))

(defn number [phone-number]
  (normalize (sanitize phone-number)))

(defn area-code [number]
  (subs number 0 area-code-length))

(defn pretty-print [phone-number]
  (apply format pretty-print-format (parse-groups (number phone-number))))

