#import "/styles/figure.typ": *

#let time = linspace(0, 3, num: 121)
#let stable-response = time.map(value => calc.exp(-value))
#let marginal-response = time.map(_ => 1)
#let unstable-response = time.map(value => calc.exp(value))

#let response-stroke = (
  paint: color-secondary,
  thickness: plot-stroke-width,
  cap: "round",
  join: "round",
)

#let fixed-y-label(value) = box(
  width: 7mm,
  align(right + horizon)[#value],
)

#let fixed-y-title(body) = box(
  height: 8mm,
  align(center + horizon, move(dy: 6mm, body)),
)

#let response-panel(response, ylim, yticks, equation, show-y: false) = {
  let response-ylabel = fixed-y-title([Response, $x_c/x_0$])
  move(dx: -3mm, scale(70%, reflow: true)[
    #book-diagram(
      size: "panel",
      height: 36mm,
      xlabel: [$t$],
      ylabel: if show-y { response-ylabel } else { hide(response-ylabel) },
      xlim: (0, 3),
      ylim: ylim,
      xaxis: (
        subticks: none,
        ticks: (0, 1, 2, 3),
      ),
      yaxis: (
        subticks: none,
        ticks: yticks.map(value => (value, fixed-y-label(value))),
      ),
      plot(
        time,
        response,
        stroke: response-stroke,
      ),
      place(
        1.75,
        ylim.at(1) * 0.78,
        text(size: 12pt)[#equation],
        align: center,
      ),
    )
  ])
}

#let pole-panel(location, show-y: false) = {
  let pole-ylabel = fixed-y-title([Imaginary part])
  let pole-yticks = (-0.5, 0, 0.5)
  move(dx: -3mm, scale(70%, reflow: true)[
    #book-diagram(
      size: "panel",
      height: 25mm,
      xlabel: [Real part of $p$],
      ylabel: if show-y { pole-ylabel } else { hide(pole-ylabel) },
      xlim: (-1.5, 1.5),
      ylim: (-0.75, 0.75),
      xaxis: (
        subticks: none,
        ticks: (-1, 0, 1),
      ),
      yaxis: (
        subticks: none,
        ticks: pole-yticks.map(value => (value, fixed-y-label(value))),
      ),
      vlines(0, stroke: (paint: color-ink, thickness: 0.75pt)),
      hlines(0, stroke: (paint: color-ink, thickness: 0.75pt)),
      scatter(
        (location,),
        (0,),
        mark: "x",
        size: (8pt,),
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
      (0, 1.1),
      (0, 0.5, 1),
      [$x_c/x_0=e^{-t}$],
      show-y: true,
    ),
    response-panel(
      marginal-response,
      (0, 1.1),
      (0, 0.5, 1),
      [$x_c/x_0=1$],
    ),
    response-panel(
      unstable-response,
      (0, 21),
      (0, 10, 20),
      [$x_c/x_0=e^t$],
    ),
    pole-panel(-1, show-y: true),
    pole-panel(0),
    pole-panel(1),
    move(dx: 2.5mm, box(width: 51.53mm, align(center)[
      #text(weight: "bold", fill: color-secondary)[Stable, $p<0$]
    ])),
    move(dx: 2.5mm, box(width: 51.53mm, align(center)[
      #text(weight: "bold", fill: color-secondary)[Marginal, $p=0$]
    ])),
    move(dx: 2.5mm, box(width: 51.53mm, align(center)[
      #text(weight: "bold", fill: color-secondary)[Unstable, $p>0$]
    ])),
  )
]
