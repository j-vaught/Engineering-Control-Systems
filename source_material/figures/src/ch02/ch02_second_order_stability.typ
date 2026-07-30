#import "/styles/figure.typ": *

#let time = linspace(0, 8, num: 321)
#let stable-response = time.map(t =>
  calc.exp(-0.28 * t) * calc.sin(2.8 * t)
)
#let marginal-response = time.map(t => calc.sin(2.8 * t))
#let unstable-response = time.map(t =>
  calc.exp(0.18 * t) * calc.sin(2.8 * t)
)
#let stable-envelope = time.map(t => calc.exp(-0.28 * t))
#let marginal-envelope = time.map(_ => 1)
#let unstable-envelope = time.map(t => calc.exp(0.18 * t))

#let response-stroke = (
  paint: color-secondary,
  thickness: plot-stroke-width,
  dash: none,
  cap: "round",
  join: "round",
)
#let envelope-stroke = (
  paint: color-guide,
  thickness: line-normal,
  dash: "dashed",
  cap: "butt",
)
#let callout-stroke = (
  paint: color-ink,
  thickness: line-normal,
  dash: none,
  cap: "butt",
)

#let fixed-y-label(value) = box(
  width: 7mm,
  align(right + horizon)[#value],
)

#let fixed-y-title(body) = box(
  height: 8mm,
  align(center + horizon, move(dy: 6mm, body)),
)

#let response-panel(
  response,
  envelope,
  ylim,
  yticks,
  equation,
  equation-x,
  equation-y,
  callout-start: none,
  callout-end: none,
  show-y: false,
) = {
  let response-ylabel = fixed-y-title([Normalized response])
  move(dx: -3mm, scale(70%, reflow: true)[
    #book-diagram(
      size: "panel",
      height: 36mm,
      xlabel: [$t$],
      ylabel: if show-y { response-ylabel } else { hide(response-ylabel) },
      xlim: (0, 8),
      ylim: ylim,
      xaxis: (
        subticks: none,
        ticks: (0, 2, 4, 6, 8),
      ),
      yaxis: (
        subticks: none,
        ticks: yticks.map(value => (value, fixed-y-label(value))),
      ),
      hlines(
        0,
        stroke: (paint: color-ink, thickness: line-normal),
      ),
      plot(
        time,
        response,
        stroke: response-stroke,
      ),
      plot(
        time,
        envelope,
        stroke: envelope-stroke,
      ),
      plot(
        time,
        envelope.map(value => -value),
        stroke: envelope-stroke,
      ),
      if callout-end != none {
        plot(
          (callout-start.at(0), callout-end.at(0)),
          (callout-start.at(1), callout-end.at(1)),
          stroke: callout-stroke,
        )
      },
      if callout-end != none {
        scatter(
          (callout-end.at(0),),
          (callout-end.at(1),),
          mark: "o",
          size: (3pt,),
          color: color-ink,
          stroke: none,
        )
      },
      place(
        equation-x,
        equation-y,
        box(fill: color-background, inset: (x: 0.8mm, y: 0.4mm))[
          #text(size: 9pt)[#equation]
        ],
        align: center,
      ),
    )
  ])
}

#let pole-panel(real-part, show-y: false) = {
  let pole-ylabel = fixed-y-title([Imaginary part])
  let pole-yticks = (-2, -1, 0, 1, 2)
  move(dx: -3mm, scale(70%, reflow: true)[
    #book-diagram(
      size: "panel",
      height: 34mm,
      xlabel: [Real part of $p$],
      ylabel: if show-y { pole-ylabel } else { hide(pole-ylabel) },
      xlim: (-1.25, 1.25),
      ylim: (-2.1, 2.1),
      xaxis: (
        subticks: none,
        ticks: (-1, 0, 1),
      ),
      yaxis: (
        subticks: none,
        ticks: pole-yticks.map(value => (value, fixed-y-label(value))),
      ),
      vlines(
        -0.5,
        0.5,
        stroke: plot-grid-stroke,
        z-index: 0,
      ),
      vlines(0, stroke: (paint: color-ink, thickness: line-normal)),
      hlines(0, stroke: (paint: color-ink, thickness: line-normal)),
      scatter(
        (real-part, real-part),
        (-1.2, 1.2),
        mark: "x",
        size: (8pt, 8pt),
        color: color-secondary,
        stroke: (paint: color-secondary, thickness: 1.3pt),
      ),
    )
  ])
}

#standalone[
  #set text(size: 8pt)
  #grid(
    columns: (51.53mm, 51.53mm, 51.53mm),
    column-gutter: 2mm,
    row-gutter: 1mm,
    align: top + left,
    response-panel(
      stable-response,
      stable-envelope,
      (-1.1, 1.1),
      (-1, -0.5, 0, 0.5, 1),
      [$e^(-zeta omega_n t) sin(omega_d t + phi)$],
      3.25,
      0.87,
      callout-start: (5.15, 0.74),
      callout-end: (5.8, calc.exp(-0.28 * 5.8)),
      show-y: true,
    ),
    response-panel(
      marginal-response,
      marginal-envelope,
      (-1.5, 1.5),
      (-1.5, -1, -0.5, 0, 0.5, 1, 1.5),
      [$sin(omega_n t + phi)$],
      4,
      1.28,
    ),
    response-panel(
      unstable-response,
      unstable-envelope,
      (-4.6, 4.6),
      (-4, -2, 0, 2, 4),
      [$e^(abs(zeta) omega_n t) sin(omega_d t + phi)$],
      3.25,
      3.65,
      callout-start: (5.4, 3.35),
      callout-end: (6.2, calc.exp(0.18 * 6.2)),
    ),
    pole-panel(-0.6, show-y: true),
    pole-panel(0),
    pole-panel(0.6),
    move(dx: 2.5mm, box(width: 51.53mm, align(center)[
      #text(weight: "bold", fill: color-secondary)[Stable, $zeta > 0$]
    ])),
    move(dx: 2.5mm, box(width: 51.53mm, align(center)[
      #text(weight: "bold", fill: color-secondary)[Marginal, $zeta = 0$]
    ])),
    move(dx: 2.5mm, box(width: 51.53mm, align(center)[
      #text(weight: "bold", fill: color-secondary)[Unstable, $zeta < 0$]
    ])),
  )
]
