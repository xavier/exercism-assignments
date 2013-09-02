(def letters (map char (range (int \A) (int \Z))))

(defn- random-digit [] (rand-int 10))
(defn- random-letter [] (rand-nth letters))

(defn- new-robot-name []
  (str (random-letter) (random-letter) (random-digit) (random-digit) (random-digit)))

(defn robot [] (atom (new-robot-name)))

(defn robot-name [robot] @robot)

(defn reset-name [robot] (reset! robot (new-robot-name)))
