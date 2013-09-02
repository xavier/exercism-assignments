(def letters (map char (range (int \A) (int \Z))))

(defn- random-digit [] (rand-int 10))
(defn- random-letter [] (rand-nth letters))

(defn- new-robot-name []
  (apply str (concat (repeatedly 2 random-letter) (repeatedly 3 random-digit))))

(new-robot-name)

(defn robot [] (atom (new-robot-name)))

(defn robot-name [robot] @robot)

(defn reset-name [robot] (reset! robot (new-robot-name)))
