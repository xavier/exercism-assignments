(ns school)

(def empty-grade [])

(defn grade [db g]
  (db g empty-grade))

(defn add [db student student-grade]
  (assoc db student-grade (conj (grade db student-grade) student)))

(defn sorted [db]
  (into (sorted-map) (for [[g students] db] [g (sort students)])))