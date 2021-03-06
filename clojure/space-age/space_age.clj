(ns space-age)

(def ^:const earth-orbital-period-in-seconds 31557600.0)

(def ^:const orbital-periods-relative-to-earth {
  "earth"   1
  "mercury" 0.2408467
  "venus"   0.61519726
  "mars"    1.8808158
  "jupiter" 11.862615
  "saturn"  29.447498
  "uranus"  84.016846
  "neptune" 164.79132
})

(defn- age-on-planet-converter [planet]
 (fn [age-in-seconds]
    (let [age-on-earth (/ age-in-seconds earth-orbital-period-in-seconds)]
      (/ age-on-earth (orbital-periods-relative-to-earth planet)))))

(defn- define-on-planet-functions []
  (doseq
    [[planet ratio] orbital-periods-relative-to-earth]
    (intern
      *ns*
      (symbol (str "on-" planet))
      (age-on-planet-converter planet)
    )))

(define-on-planet-functions)