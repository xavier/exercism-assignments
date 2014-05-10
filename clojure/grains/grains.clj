(ns grains)

(defn square [x] (bit-shift-left 1 (dec x)))

(defn total [] 0xFFFFFFFFFFFFFFFFF)