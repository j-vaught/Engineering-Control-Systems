#import "/styles/figure.typ": *

// figure-pipeline: kind=mechanics
#standalone(
  cetz-canvas(
    length: 1mm,
    {
      viscous-damper(
        (0, 21),
        length: 28,
        body-height: 3.4,
      )
      draw.content((14, 16), [horizontal])

      viscous-damper(
        (44, 3),
        length: 28,
        angle: 90deg,
        body-height: 3.4,
      )
      draw.content((44, -1), [vertical])

      viscous-damper(
        (72, 5),
        length: 28,
        angle: 40deg,
        body-height: 3.4,
      )
      draw.content((83, 1), [inclined])
    },
  )
)
