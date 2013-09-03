(defn- make-divisible-by [divisor]
  #(= (mod %1 divisor) 0))

(def divisible-by-4?   (make-divisible-by 4))
(def divisible-by-100? (make-divisible-by 100))
(def divisible-by-400? (make-divisible-by 400))

(defn leap-year [year]
  (cond
    (divisible-by-400? year) true
    (divisible-by-100? year) false
    (divisible-by-4? year)   true
    :else                    false))