#import "/styles/figure.typ": *

// figure-pipeline: kind=mechanics
// figure-pipeline: width-profile=full
#standalone(
  box(
    width: figure-content-width("full"),
    align(
      center,
      cetz-canvas(
        length: 1mm,
        {
          // (a) Vertical spring--mass oscillator.
          let ax = 19
          draw.rect(
            (ax - 9, 31),
            (ax + 9, 47),
            ..mechanics-body-style,
          )
          draw.content((ax, 39), [$m$])
          linear-spring(
            (ax, 31),
            length: 25,
            angle: -90deg,
            coils: 7,
            amplitude: 2.2,
            lead: 4,
          )
          fixed-support(
            (ax - 12, 6),
            length: 24,
          )
          displacement-indicator(
            (ax - 13, 37),
            length: 8,
            angle: -90deg,
            label: [$x$],
            extension: 1.6,
          )
          draw.content((ax + 5.2, 19), [$k$])
          draw.content((ax, 0.4), [(a)])

          // (b) Pendulum with a horizontal restoring spring.
          let bx = 80
          let pivot-y = 43
          let bob-y = 12
          fixed-support(
            (bx - 27, 47),
            length: 51,
            hatch-side: 1,
          )
          draw.circle(
            (bx, pivot-y),
            radius: 1.05,
            fill: color-mechanical,
            stroke: none,
          )
          draw.line((bx, pivot-y), (bx, bob-y), ..mechanics-line-style)
          draw.circle(
            (bx, bob-y),
            radius: 4.7,
            fill: color-surface-strong,
            stroke: (
              paint: color-mechanical,
              thickness: line-emphasis,
            ),
          )
          draw.content((bx + 6.2, bob-y + 1.5), [$m$])
          draw.content((bx - 2.7, 27.5), [$l$])

          // Spring from the fixed wall to the equilibrium position.
          fixed-support(
            (bx - 27, 6),
            length: 25,
            direction: 90,
            hatch-side: 1,
          )
          linear-spring(
            (bx - 27, bob-y),
            length: 23,
            coils: 6,
            amplitude: 2.1,
            lead: 4,
          )
          draw.content((bx - 15.5, bob-y + 5), [$k$])

          // Displaced configuration and angular coordinate.
          draw.line(
            (bx, pivot-y),
            (bx + 20, 15),
            ..mechanics-reference-style,
          )
          draw.circle(
            (bx + 20, 15),
            radius: 4.7,
            fill: none,
            stroke: mechanics-reference-style.stroke,
          )
          angular-displacement-indicator(
            (bx, pivot-y),
            radius: 11,
            start: -90deg,
            stop: -57deg,
            label: [$theta$],
          )
          draw.content((bx, 0.4), [(b)])

          // (c) Torsional spring--inertia oscillator.
          let cx = 137
          fixed-support(
            (cx - 13, 23),
            length: 20,
            direction: 90,
            hatch-side: 1,
          )
          torsional-spring(
            (cx, 32),
            turns: 2.75,
            outer-radius: 5,
            inner-radius: 1.4,
            lead: 8,
          )
          draw.line((cx, 32), (cx, 22), ..mechanics-line-style)
          draw.rect(
            (cx - 9, 8),
            (cx + 9, 22),
            ..mechanics-body-style,
          )
          draw.content((cx, 17.2), [$m$])
          draw.content((cx, 12.7), [$J$])
          draw.content((cx + 7.5, 35), [$k_theta$])
          angular-displacement-indicator(
            (cx, 15),
            radius: 8,
            start: 150deg,
            stop: 390deg,
            label: [$theta$],
          )
          draw.content((cx, 0.4), [(c)])
        },
      ),
    ),
  ),
)
