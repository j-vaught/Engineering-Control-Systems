#import "/styles/figure.typ": *

// figure-pipeline: kind=mechanics
#standalone(
  cetz-canvas(
    length: 1mm,
    {
      draw.circle(
        (11, 11),
        radius: 0.8,
        fill: color-mechanical,
        stroke: none,
      )
      angular-displacement-indicator(
        (11, 11),
        radius: 8,
        start: -30deg,
        stop: 65deg,
        label: [$theta$],
      )

      draw.circle(
        (38, 11),
        radius: 0.8,
        fill: color-mechanical,
        stroke: none,
      )
      angular-displacement-indicator(
        (38, 11),
        radius: 8,
        start: 210deg,
        stop: -30deg,
        label: [$phi$],
      )
    },
  )
)
