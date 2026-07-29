#import "colors.typ": *
#import "dimensions.typ": *

// Raw-CeTZ style dictionaries and dimensions only. Figure sources remain in
// control of placement and routing and use CeTZ's native named anchors.

#let diagram-block-style = (
  fill: color-surface,
  stroke: (
    paint: color-border,
    thickness: line-normal,
    cap: "square",
    join: "miter",
  ),
  radius: diagram-corner-radius,
)

#let diagram-controller-style = (
  fill: color-primary.lighten(88%),
  stroke: (
    paint: color-primary,
    thickness: line-emphasis,
    cap: "square",
    join: "miter",
  ),
  radius: diagram-corner-radius,
)

#let diagram-plant-style = (
  fill: color-secondary.lighten(89%),
  stroke: (
    paint: color-secondary,
    thickness: line-emphasis,
    cap: "square",
    join: "miter",
  ),
  radius: diagram-corner-radius,
)

#let diagram-summing-style = (
  fill: color-background,
  stroke: (
    paint: color-border,
    thickness: line-normal,
    cap: "round",
    join: "round",
  ),
)

#let diagram-branch-style = (
  fill: color-ink,
  stroke: none,
)

#let diagram-signal-style = (
  stroke: (
    paint: color-primary,
    thickness: line-emphasis,
    cap: "round",
    join: "round",
  ),
  mark: (
    end: ">>",
    fill: color-primary,
    length: arrow-length,
    width: arrow-width,
    inset: arrow-inset,
  ),
)

#let diagram-output-style = (
  stroke: (
    paint: color-output,
    thickness: line-emphasis,
    cap: "round",
    join: "round",
  ),
  mark: (
    end: ">>",
    fill: color-output,
    length: arrow-length,
    width: arrow-width,
    inset: arrow-inset,
  ),
)

#let diagram-feedback-style = (
  stroke: (
    paint: color-feedback,
    thickness: line-emphasis,
    cap: "round",
    join: "round",
  ),
  mark: (
    end: ">>",
    fill: color-feedback,
    length: arrow-length,
    width: arrow-width,
    inset: arrow-inset,
  ),
)

#let diagram-bidirectional-style = (
  stroke: (
    paint: color-primary,
    thickness: line-normal,
    cap: "round",
    join: "round",
  ),
  mark: (
    start: ">>",
    end: ">>",
    fill: color-primary,
    length: arrow-length,
    width: arrow-width,
    inset: arrow-inset,
  ),
)

#let diagram-guide-style = (
  stroke: (
    paint: color-guide,
    thickness: line-hairline,
    dash: "dashed",
    cap: "round",
  ),
)
