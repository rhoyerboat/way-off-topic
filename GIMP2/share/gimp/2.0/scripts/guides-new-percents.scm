;; -*-scheme-*-

;; Alan Horkan 2004.  No copyright.  Public Domain.
;;  + rhoyerboat 2019. increased precision value on SF-ADJUSTMENT


(define (script-fu-guide-new-percents image drawable direction position)
  (let* (
        (width (car (gimp-image-width image)))
      	(height (car (gimp-image-height image)))
        )

    (if (= direction 0)
      	(set! position (/ (* height position) 100))
	      (set! position (/ (* width position) 100))
    )

    (if (= direction 0)
	      ;; convert position to pixel
	      (if (<= position height) (gimp-image-add-hguide image position))
	      (if (<= position width) (gimp-image-add-vguide image position))
    )

    (gimp-displays-flush)
  )
)

(script-fu-register "script-fu-guide-new-percents"
  _"New Guide (by _Percents)..."
  _"Add a guide at the position specified as a percentages of the image size"
  "Alan Horkan"
  "Alan Horkan, 2004"
  "April 2004"
  "*"
  SF-IMAGE      "Input Image"      0
  SF-DRAWABLE   "Input Drawable"   0
  SF-OPTION     _"Direction"       '(_"Horizontal"
                                     _"Vertical")
  SF-ADJUSTMENT _"Position (in %s)" '(50 0 100 1 10 3 1)
)

(script-fu-menu-register "script-fu-guide-new-percents"
                         "<Image>/Image/Guides")
