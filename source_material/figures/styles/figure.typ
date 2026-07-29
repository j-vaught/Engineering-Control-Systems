#import "@preview/cetz:0.5.2" as cetz
#import "colors.typ": *
#import "typography.typ": *
#import "dimensions.typ": *
#import "diagrams.typ": *
#import "mechanics.typ": *
#import "plots.typ": *

#let cetz-canvas = cetz.canvas
#let draw = cetz.draw

// All standalone figures use a one-page, content-sized canvas. The 2 pt page
// margin is a clipping guard for strokes and arrowheads, not a paper margin.
#let standalone(body) = {
  set page(
    width: auto,
    height: auto,
    margin: figure-page-margin,
    fill: color-background,
  )
  figure-typography(body)
}
