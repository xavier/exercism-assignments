(ns meetup)

(def day-names ["monday" "tuesday" "wednesday" "thursday" "friday" "saturday" "sunday"])

; Declare monday=1, tuesday=2, ..., sunday=7
(doall
  (map-indexed (fn [day-index day-name] (intern *ns* (symbol day-name) (inc day-index))) day-names))

(defn- zeller-day-of-week
  "Calculates the day of week for the given date using Zeller's congruence (Sat=0, ..., Fri=6)"
  [year month day]
  (let [m (+ (mod (+ month 9) 12) 3)
        y (- year (quot (- m month) 12))
        J (quot y 100)
        K (mod y 100)
        q day]
    (mod (+ q
            (quot (* 26 (inc m)) 10)
            K
            (quot K 4)
            (quot J 4)
            (* 5 J))
         7)))

(defn- day-of-week [year month day]
  "(Mon=1, ..., Sun=7)"
  (inc (mod (+ (zeller-day-of-week year month day) 5) 7)))

(defn- forward-to-day-of-week [year month day target-day-of-week]
  (+ day (mod (- target-day-of-week (day-of-week year month day)) 7)))

(defn- rewind-to-day-of-week [year month day target-day-of-week]
  (- day (mod (- (day-of-week year month day) target-day-of-week) 7)))

(defn- first-day-of-week [year month target-day-of-week]
  (forward-to-day-of-week year month 1 target-day-of-week))

(defn- teenth [year month target-day-of-week]
  [year month (forward-to-day-of-week year month 13 target-day-of-week)])

(defn- advance-day-by-weeks [day weeks]
  (+ day (* weeks 7)))

(defn- nth-day-of-week [year month target-day-of-week week-number]
  [year month (advance-day-by-weeks (first-day-of-week year month target-day-of-week) (dec week-number))])

(defn leap-year? [year]
  (cond
    (zero? (mod 400 year)) true
    (zero? (mod 100 year)) false
    (zero? (mod 4   year)) true
    :else                  false))

(defn- days-in-month [year month]
  (condp contains? month
    #{1 3 5 7 8 10 12} 31
    #{4 6 9 11} 30
    #{2} (if (leap-year? year) 29 28)))

(defn- last-day-of-week [year month target-day-of-week]
  [year month (rewind-to-day-of-week year month (days-in-month year month) target-day-of-week)])

(defn- day-name-to-teenth [day-name]
  (clojure.string/replace day-name "day" "teenth"))

; Defines monteenth, tuesteenth, ..., sunteenth
(doall
  (map-indexed
    (fn [day-index fun-name]
      (intern *ns* (symbol fun-name) (fn [month year] (teenth year month (+ monday day-index))))
    )
    (map day-name-to-teenth day-names)))

; Defines <week-name>-monday, <week-name>-tuesday, ... <week-name>-sunday
(defn- define-nth-day-functions [week-name week-number]
  (doall
    (map-indexed
      (fn [day-index day-name]
        (let [
          fun-name (symbol (str week-name "-" day-name))
          fun-body (fn [month year] (nth-day-of-week year month (+ monday day-index) week-number))]
          (intern *ns* fun-name fun-body)))
      day-names)
    ))

; Defines first-monday, first-tuesday, ..., second-monday, second-tuesday, ..., fourth-sunday
(doall
  (map-indexed
    (fn [week-index week-name]
      (define-nth-day-functions week-name (inc week-index))
    )
    ["first" "second" "third" "fourth"])
  )

; Define last-monday, last-tuesday, ..., last-sunday
(doall
  (map-indexed
    (fn [day-index day-name]
      (let [
        fun-name (symbol (str "last-" day-name))
        fun-body (fn [month year] (last-day-of-week year month (+ monday day-index)))]
        (intern *ns* fun-name fun-body)))
    day-names)
  )
