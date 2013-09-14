(ns meetup)

(def monday    1)
(def tuesday   2)
(def wednesday 3)
(def thursday  4)
(def friday    5)
(def saturday  6)
(def sunday    7)

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

(defn- advance-to-first [year month day target-day-of-week]
  (+ day (mod (- target-day-of-week (day-of-week year month day)) 7)))

(defn- backward-to-first [year month day target-day-of-week]
  (- day (mod (- (day-of-week year month day) target-day-of-week) 7)))

(defn- first-day-of-week [year month target-day-of-week]
  (advance-to-first year month 1 target-day-of-week))

(defn- teenth [year month target-day-of-week]
  [year month (advance-to-first year month 13 target-day-of-week)])

(defn- advance-day-by-weeks [day weeks]
  (+ day (* weeks 7)))

(defn- nth-day-of-week [year month target-day-of-week week-number]
  [year month (advance-day-by-weeks (first-day-of-week year month target-day-of-week) (dec week-number))])

; TODO support leap years
(defn- days-in-month [year month]
  (condp contains? month
    #{1 3 5 7 8 10 12} 31
    #{4 6 9 11} 30
    #{2} 28))

(defn- last-day-of-week [year month target-day-of-week]
  [year month (backward-to-first year month (days-in-month year month) target-day-of-week)])

(defn monteenth    [month year] (teenth year month monday))
(defn tuesteenth   [month year] (teenth year month tuesday))
(defn wednesteenth [month year] (teenth year month wednesday))
(defn thursteenth  [month year] (teenth year month thursday))
(defn friteenth    [month year] (teenth year month friday))
(defn saturteenth  [month year] (teenth year month saturday))
(defn sunteenth    [month year] (teenth year month sunday))

(defn first-monday    [month year]  (nth-day-of-week year month monday    1))
(defn first-tuesday   [month year]  (nth-day-of-week year month tuesday   1))
(defn first-wednesday [month year]  (nth-day-of-week year month wednesday 1))
(defn first-thursday  [month year]  (nth-day-of-week year month thursday  1))
(defn first-friday    [month year]  (nth-day-of-week year month friday    1))
(defn first-saturday  [month year]  (nth-day-of-week year month saturday  1))
(defn first-sunday    [month year]  (nth-day-of-week year month sunday    1))

(defn second-monday    [month year] (nth-day-of-week year month monday    2))
(defn second-tuesday   [month year] (nth-day-of-week year month tuesday   2))
(defn second-wednesday [month year] (nth-day-of-week year month wednesday 2))
(defn second-thursday  [month year] (nth-day-of-week year month thursday  2))
(defn second-friday    [month year] (nth-day-of-week year month friday    2))
(defn second-saturday  [month year] (nth-day-of-week year month saturday  2))
(defn second-sunday    [month year] (nth-day-of-week year month sunday    2))

(defn third-monday    [month year]  (nth-day-of-week year month monday    3))
(defn third-tuesday   [month year]  (nth-day-of-week year month tuesday   3))
(defn third-wednesday [month year]  (nth-day-of-week year month wednesday 3))
(defn third-thursday  [month year]  (nth-day-of-week year month thursday  3))
(defn third-friday    [month year]  (nth-day-of-week year month friday    3))
(defn third-saturday  [month year]  (nth-day-of-week year month saturday  3))
(defn third-sunday    [month year]  (nth-day-of-week year month sunday    3))

(defn fourth-monday    [month year] (nth-day-of-week year month monday    4))
(defn fourth-tuesday   [month year] (nth-day-of-week year month tuesday   4))
(defn fourth-wednesday [month year] (nth-day-of-week year month wednesday 4))
(defn fourth-thursday  [month year] (nth-day-of-week year month thursday  4))
(defn fourth-friday    [month year] (nth-day-of-week year month friday    4))
(defn fourth-saturday  [month year] (nth-day-of-week year month saturday  4))
(defn fourth-sunday    [month year] (nth-day-of-week year month sunday    4))

(defn last-monday    [month year] (last-day-of-week year month monday))
(defn last-tuesday   [month year] (last-day-of-week year month tuesday))
(defn last-wednesday [month year] (last-day-of-week year month wednesday))
(defn last-thursday  [month year] (last-day-of-week year month thursday))
(defn last-friday    [month year] (last-day-of-week year month friday))
(defn last-saturday  [month year] (last-day-of-week year month saturday))
(defn last-sunday    [month year] (last-day-of-week year month sunday))