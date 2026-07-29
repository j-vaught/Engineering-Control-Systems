#import "/styles/figure.typ": *

// figure-pipeline: kind=mechanics
#standalone(
  cetz-canvas(
    length: 1mm,
    {
      linear-spring((0, 18), length: 28, coils: 8)
      draw.content((14, 13), [horizontal])

      linear-spring(
        (43, 2),
        length: 28,
        angle: 90deg,
        coils: 8,
      )
      draw.content((43, -2), [vertical])

      linear-spring(
        (68, 5),
        length: 28,
        angle: 35deg,
        coils: 8,
      )
      draw.content((79, 1), [inclined])
    },
  )
)
