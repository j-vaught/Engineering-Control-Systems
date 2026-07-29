#import "@preview/cetz:0.5.2" as cetz
#import "colors.typ": *
#import "dimensions.typ": *
#import "mechanics.typ": *

#let draw = cetz.draw

#let mechanics-mm(value) = if type(value) == length {
  value / 1mm
} else {
  value
}

#let mechanics-angle(value) = if type(value) == angle {
  value
} else {
  value * 1deg
}

// Run component geometry in a local coordinate system whose positive x-axis
// points along the component. Angles are measured counterclockwise.
#let mechanics-frame(origin, angle, body) = {
  draw.group({
    draw.set-origin(origin)
    draw.rotate(angle)
    body
  })
}

// Fixed support usable as a floor, ceiling, or wall.
// hatch-side = -1 places hatching below the support; +1 places it above.
#let fixed-support(
  origin,
  length: 2cm,
  direction: 0,
  hatch-side: -1,
  hatch-depth: 2.7,
  hatch-spacing: 1.5,
  hatch-direction: "forward",
) = {
  assert(
    hatch-direction in ("forward", "backward"),
    message: "hatch-direction must be \"forward\" or \"backward\"",
  )
  let support-length = mechanics-mm(length)
  let support-direction = mechanics-angle(direction)
  let hatch-slant = if hatch-direction == "forward" { -35deg } else { 35deg }
  let hatch-angle = hatch-side * 90deg + hatch-slant
  let hatch-count = calc.floor(support-length / hatch-spacing) + 1
  let hatch-span = (hatch-count - 1) * hatch-spacing
  let hatch-inset = (support-length - hatch-span) / 2
  mechanics-frame(origin, support-direction, {
    // Draw hatching first so the heavy support edge remains visually
    // continuous and masks the ends of the thinner hatch strokes.
    for x in range(hatch-count) {
      let position = hatch-inset + x * hatch-spacing
      draw.line(
        (position, 0),
        (
          position + hatch-depth * calc.cos(hatch-angle),
          hatch-depth * calc.sin(hatch-angle),
        ),
        ..mechanics-hatch-style,
      )
    }
    draw.line(
      (0, 0),
      (support-length, 0),
      ..mechanics-support-style,
    )
  })
}

// Axial spring with straight leads at both ends.
#let linear-spring(
  origin,
  length: 2cm,
  angle: 0deg,
  coils: 7,
  amplitude: 2,
  lead: 3,
) = {
  let rendered-length = mechanics-mm(length)
  let lead-length = mechanics-mm(lead)
  assert(
    rendered-length > 2 * lead-length,
    message: "spring length is too short for the selected leads",
  )
  mechanics-frame(origin, angle, {
    let working = rendered-length - 2 * lead-length
    let peak-count = 2 * coils
    let peak-spacing = working / peak-count
    let points = ((0, 0), (lead-length, 0))

    // Peak centers are offset by half a pitch from both coil endpoints. This
    // makes the first and last half-coils equal and removes endpoint crowding.
    for index in range(peak-count) {
      let x = lead-length + (index + 0.5) * peak-spacing
      let y = if calc.rem(index, 2) == 0 { amplitude } else { -amplitude }
      points.push((x, y))
    }
    points.push((rendered-length - lead-length, 0))
    points.push((rendered-length, 0))
    draw.line(..points, ..mechanics-spring-style)
  })
}

// Viscous dashpot. The piston begins at the origin and the closed cylinder
// end terminates at origin + length along the selected orientation.
#let viscous-damper(
  origin,
  length: 18,
  angle: 0deg,
  body-length: 9,
  body-height: 4,
  piston-position: 0.48,
) = mechanics-frame(origin, angle, {
  let cylinder-start = length - body-length
  let piston-x = cylinder-start + body-length * piston-position
  draw.line((0, 0), (piston-x, 0), ..mechanics-damper-style)
  draw.line(
    (piston-x, -body-height * 0.42),
    (piston-x, body-height * 0.42),
    ..mechanics-damper-style,
  )
  draw.line(
    (cylinder-start, -body-height / 2),
    (length, -body-height / 2),
    (length, body-height / 2),
    (cylinder-start, body-height / 2),
    ..mechanics-damper-style,
  )
})

// Planar torsional spring symbol. The outer connection is tangent to the
// first coil; the inner connection ends at the rotational axis.
#let torsional-spring(
  origin,
  angle: 0deg,
  turns: 2.5,
  outer-radius: 5,
  inner-radius: 1.4,
  lead: 4,
  samples-per-turn: 24,
) = mechanics-frame(origin, angle, {
  let sample-count = calc.ceil(turns * samples-per-turn)
  let points = ((-outer-radius - lead, 0), (-outer-radius, 0))
  for index in range(sample-count + 1) {
    let progress = index / sample-count
    let theta = 180deg + progress * turns * 360deg
    let radius = outer-radius + (inner-radius - outer-radius) * progress
    points.push((
      radius * calc.cos(theta),
      radius * calc.sin(theta),
    ))
  }
  points.push((0, 0))
  draw.line(..points, ..mechanics-spring-style)
})

// Linear displacement measured from a datum to a displaced position.
#let displacement-indicator(
  origin,
  length: 12,
  angle: 0deg,
  label: [$x$],
  offset: 0,
  extension: 2.5,
  arrow: arrow-medium,
) = mechanics-frame(origin, angle, {
  draw.line(
    (0, -extension),
    (0, extension),
    ..mechanics-reference-style,
  )
  draw.line(
    (length, -extension),
    (length, extension),
    ..mechanics-reference-style,
  )
  draw.line(
    (0, offset),
    (length, offset),
    stroke: mechanics-displacement-style.stroke,
    mark: (fill: color-displacement, ..arrow),
  )
  draw.content(
    (length / 2, offset + 2),
    label,
  )
})

// Angular displacement about an origin.
#let angular-displacement-indicator(
  origin,
  radius: 7,
  start: 0deg,
  stop: 60deg,
  label: [$theta$],
  arrow: arrow-medium,
) = {
  let start-point = (
    origin.at(0) + radius * calc.cos(start),
    origin.at(1) + radius * calc.sin(start),
  )
  draw.arc(
    start-point,
    start: start,
    stop: stop,
    radius: radius,
    stroke: mechanics-displacement-style.stroke,
    mark: (fill: color-displacement, ..arrow),
  )
  let middle = (start + stop) / 2
  draw.content(
    (
      origin.at(0) + (radius + 2.2) * calc.cos(middle),
      origin.at(1) + (radius + 2.2) * calc.sin(middle),
    ),
    label,
  )
}
