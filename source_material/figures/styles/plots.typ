#import "@preview/lilaq:0.6.0" as lq
#import "colors.typ": *
#import "dimensions.typ": *

// Lilaq is imported only in this module. Figure sources consume these aliases
// and must wrap every quantitative plot in `book-diagram`.
#let plot = lq.plot
#let scatter = lq.scatter
#let line = lq.line
#let ellipse = lq.ellipse
#let rect = lq.rect
#let hlines = lq.hlines
#let vlines = lq.vlines
#let place = lq.place
#let linspace = lq.linspace
#let arange = lq.arange

#let _book-plot-cycle-entry(color, dash: none) = {
  let line-stroke = (
    paint: color,
    thickness: plot-stroke-width,
    cap: "round",
    join: "round",
  )
  if dash != none {
    line-stroke.insert("dash", dash)
  }
  (
    color: color,
    mark: "none",
    stroke: line-stroke,
  )
}

// Color is never the only series discriminator. The first three entries use
// the conventional solid, dashed, and dash-dot sequence; later entries retain
// distinct patterns when a diagram needs more series.
#let book-plot-cycle = (
  _book-plot-cycle-entry(plot-color-cycle.at(0)),
  _book-plot-cycle-entry(plot-color-cycle.at(1), dash: "dashed"),
  _book-plot-cycle-entry(plot-color-cycle.at(2), dash: "dash-dotted"),
  _book-plot-cycle-entry(plot-color-cycle.at(3), dash: "dotted"),
  _book-plot-cycle-entry(plot-color-cycle.at(4), dash: "densely-dashed"),
  _book-plot-cycle-entry(plot-color-cycle.at(5), dash: "densely-dash-dotted"),
)

#let plot-axis-stroke = (
  paint: color-ink,
  thickness: plot-axis-width,
  cap: "square",
)

#let plot-grid-stroke = (
  paint: color-grid.lighten(20%),
  thickness: plot-grid-width * 0.85,
)

#let plot-guide-stroke = (
  paint: color-guide,
  thickness: line-hairline,
  dash: "dashed",
  cap: "round",
)

#let plot-legend-stroke = (
  paint: color-grid,
  thickness: line-hairline,
)

#let _framed-plot-theme(body) = {
  // Use Lilaq's conventional framed layout for the book's quantitative plots.
  // Bottom and left axes carry the ticks and labels; tickless mirrors close the
  // top and right sides into a clean rectangular data frame.
  show: lq.set-diagram(
    width: plot-width,
    height: plot-height,
    cycle: book-plot-cycle,
    fill: color-background,
    bounds: "strict",
    margin: 4%,
    xaxis: (mirror: (ticks: false), subticks: none),
    yaxis: (mirror: (ticks: false), subticks: none),
  )
  show: lq.set-grid(
    stroke: plot-grid-stroke,
    stroke-sub: none,
  )
  show: lq.set-spine(stroke: plot-axis-stroke)
  show: lq.set-tick(
    stroke: plot-axis-stroke,
    inset: 3pt,
    outset: 0pt,
    pad: 0.35em,
  )
  show: lq.set-legend(
    fill: color-background,
    stroke: plot-legend-stroke,
    inset: 0.35em,
    radius: 0pt,
    pad: 3pt,
  )
  body
}

#let book-diagram(..args) = _framed-plot-theme(lq.diagram(..args))

#let book-layout(body) = {
  show: lq.layout
  body
}
