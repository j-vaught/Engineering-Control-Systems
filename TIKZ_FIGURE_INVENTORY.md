# Direct LaTeX/TikZ Figure Inventory

This inventory lists figures that should be implemented directly in the book's
LaTeX source with TikZ or PGFPlots. It is organized only to the chapter and
section level; figures that occur in a subsubsection are listed under their
parent section.

Photographs, software screenshots, and externally embedded chapter material are
outside the scope of this inventory.

The implementation labels used below are:

- **TikZ** — diagrams, schematics, block diagrams, and annotated constructions.
- **PGFPlots** — mathematical curves, signals, response plots, and complex-plane
  plots.
- **TikZ + PGFPlots** — composite figures containing both a diagram and a plot.

## Chapter 1 — Basic Concepts

### 1.1 Basics of Control System

- [x] **CeTZ:** Process with its input and output
  ([source](source_material/figures/src/ch01/ch01_cs_io.typ)).
- [ ] **TikZ:** Open-loop control system without feedback.
- [ ] **TikZ:** Closed-loop control system with feedback.
- [ ] **TikZ:** Multivariable control system with multiple inputs and outputs.

### 1.2 Videos of Control Systems

No direct LaTeX/TikZ figures identified.

### 1.3 History

No direct LaTeX/TikZ figures identified.

### 1.4 Examples of Control Systems

No direct LaTeX/TikZ figures identified.

## Chapter 2 — Systems

### 2.1 Basic Concepts in Vibrations

No direct LaTeX/TikZ figures identified.

### 2.2 Single Degree-of-Freedom Systems

- [ ] **TikZ:** Examples of single-degree-of-freedom systems: vertical
  spring–mass system, simple pendulum, and rotational spring–mass system.
- [ ] **TikZ:** Annotated spring–mass model and its equivalent point-mass
  free-body diagram.
- [ ] **TikZ + PGFPlots:** Linear spring deformation and corresponding
  force–displacement relationship.
- [ ] **TikZ:** Horizontal spring–mass model at its initial position and its
  free-body diagram.
- [ ] **TikZ:** Horizontal spring–mass system.
- [ ] **TikZ:** Free-body diagram of a horizontal spring–mass system.
- [ ] **TikZ:** Vertical spring–mass system.
- [ ] **TikZ:** Free-body diagram of a vertical spring–mass system.

### 2.3 Forcing Function

- [ ] **PGFPlots:** Unit-step function and its piecewise definition.
- [ ] **PGFPlots:** Finite-duration pulse function and its piecewise definition.
- [ ] **PGFPlots:** Unit-impulse construction and unit-area definition.
- [ ] **PGFPlots:** Ramp function and its piecewise definition.

### 2.4 Introduction to Stability

- [ ] **PGFPlots:** Transfer-function surface with annotated poles and zeros.
- [ ] **PGFPlots:** Comparison of three transfer functions in the complex
  frequency domain.

### 2.5 First-Order Systems

- [ ] **TikZ:** Forced spring–dashpot system and its free-body diagram.
- [ ] **PGFPlots:** Exponential free decay of a first-order system.
- [ ] **PGFPlots:** Stable, marginal, and unstable first-order responses for
  different pole locations.

### 2.6 Second-Order Systems

- [ ] **TikZ:** Forced horizontal spring–mass system and its free-body diagram.
- [ ] **PGFPlots:** Harmonic motion showing amplitude, period, phase, initial
  displacement, and maximum velocity.
- [ ] **TikZ:** Euler's formula illustrated on the complex unit circle.

### 2.7 Forced Vibration Response

No direct LaTeX/TikZ figures identified.

### 2.8 Spring–Mass–Damper Oscillator

- [ ] **TikZ:** Forced horizontal spring–mass–damper system and its free-body
  diagram.
- [ ] **PGFPlots:** Exponential decay and harmonic oscillation shown as separate
  components.
- [ ] **PGFPlots:** Damped free response with positive and negative exponential
  envelopes.

### 2.9 Stability of Second-Order Systems

- [ ] **PGFPlots:** Stable, marginal, and unstable second-order responses with
  corresponding pole locations.
- [ ] **PGFPlots:** Underdamped, critically damped, and overdamped vibration
  responses.
- [ ] **PGFPlots:** Second-order pole locations and their corresponding temporal
  responses.

## Chapter 3 — Transfer Functions

### Chapter 3 Introduction

- [ ] **TikZ:** Generic system subjected to an input and producing an output.

### 3.1 Laplace Transforms

No direct LaTeX/TikZ figures identified.

### 3.2 Transfer-Function Method for Solving Vibrating Systems

- [ ] **TikZ:** Horizontal spring–mass model.
- [ ] **PGFPlots:** Unit impulse applied at the origin.
- [ ] **PGFPlots:** Underdamped and undamped responses to an impulse.
- [ ] **PGFPlots:** Representation of an arbitrary excitation as a sequence of
  impulses.
- [ ] **PGFPlots:** Response to two successive impacts.

### 3.3 Laplace Method in Controls

- [ ] **PGFPlots:** Exponential function in the time domain and complex
  frequency domain.
- [ ] **PGFPlots:** Step function in the time domain and complex frequency
  domain.
- [ ] **PGFPlots:** Ramp function in the time domain and complex frequency
  domain.
- [ ] **PGFPlots:** Shifted step function in the time domain and complex
  frequency domain.
- [ ] **PGFPlots:** Pulse function in the time domain and complex frequency
  domain.
- [ ] **PGFPlots:** Impulse function in the time domain and complex frequency
  domain.

### 3.4 Properties of Laplace Transforms

- [ ] **PGFPlots:** Original signal and its time-shifted counterpart.

### 3.5 Convolution Property of Laplace Transforms

No direct LaTeX/TikZ figures identified.

### 3.6 Transfer Functions for Responses to Random Inputs

- [ ] **TikZ:** Transfer-function block diagram in the complex frequency domain.
- [ ] **TikZ:** Externally excited spring–mass–damper system.
- [ ] **PGFPlots:** Three-dimensional relationship between temporal and
  frequency-domain representations.
- [ ] **PGFPlots:** Sinusoidal and uniform-random input signals.
- [ ] **PGFPlots:** Autocorrelation of sinusoidal and uniform-random inputs.
- [ ] **PGFPlots:** Power spectral densities of sinusoidal and uniform-random
  inputs.
- [ ] **PGFPlots:** Response of a spring–mass–damper system to white-noise
  excitation.

### 3.7 Inverse Laplace Transform

- [ ] **PGFPlots:** Time-series response obtained through the inverse Laplace
  transform.

### 3.8 Dominant Poles

- [ ] **PGFPlots:** Pole map and temporal response for dominant poles on the
  imaginary axis.
- [ ] **PGFPlots:** Pole map and temporal response for dominant poles in the
  left half-plane.

## Chapter 4 — Time-Series Response

### 4.1 Transfer-Function Block Diagrams

No direct LaTeX/TikZ figures identified.

### 4.2 Order Versus Type

No direct LaTeX/TikZ figures identified.

### 4.3 Time Response

- [ ] **PGFPlots:** Step function in the time domain and complex frequency
  domain.
- [ ] **PGFPlots:** Pulse function in the time domain and complex frequency
  domain.
- [ ] **PGFPlots:** Ramp function in the time domain and complex frequency
  domain.

### 4.4 First-Order System Time Response

- [ ] **PGFPlots:** General first-order response and time constant.
- [ ] **PGFPlots:** First-order step response.
- [ ] **PGFPlots:** First-order impulse response.
- [ ] **PGFPlots:** First-order ramp response.
- [ ] **TikZ + PGFPlots:** Summary of first-order step, impulse, and ramp
  responses.
- [ ] **PGFPlots:** Examples of first-order responses in physical systems.

### 4.5 Second-Order System Time Response

- [ ] **PGFPlots:** Second-order step response.
- [ ] **PGFPlots:** Geometric and trigonometric construction for the
  second-order step-response derivation.
- [ ] **PGFPlots:** Supporting construction for the second-order step-response
  derivation.
- [ ] **PGFPlots:** Second-order impulse response.
- [ ] **PGFPlots:** Geometric and trigonometric construction for the
  second-order impulse-response derivation.
- [ ] **PGFPlots:** Supporting construction for the second-order
  impulse-response derivation.
- [ ] **PGFPlots:** Second-order ramp response.
- [ ] **PGFPlots:** Geometric construction for the second-order ramp-response
  derivation.
- [ ] **TikZ + PGFPlots:** Summary of second-order step, impulse, and ramp
  responses.

### 4.6 Stability of Response

- [ ] **TikZ:** Stable-system block diagram.
- [ ] **PGFPlots:** Representative stable first- and second-order responses.
- [ ] **PGFPlots:** First-order stability as a function of pole location.
- [ ] **PGFPlots:** Second-order pole locations and their temporal responses.
- [ ] **PGFPlots:** Higher-order stability for systems with real poles.
- [ ] **PGFPlots:** Higher-order stability for systems with complex poles.
- [ ] **PGFPlots:** Stable region of the complex plane.

## Chapter 5 — Performance Indicators

### 5.1 First-Order Generic Performance Indicators

- [ ] **PGFPlots:** First-order step response with steady-state error.
- [ ] **PGFPlots:** First-order impulse response with steady-state error.
- [ ] **PGFPlots:** First-order ramp response with steady-state error.

### 5.2 First-Order System-Specific Performance Indicators

- [ ] **PGFPlots:** First-order rise-time levels at one through four time
  constants.
- [ ] **PGFPlots:** First-order settling time and tolerance band.
- [ ] **PGFPlots:** First-order decay response and successive half-time
  measurements.

### 5.3 Second-Order Generic Performance Indicators

- [ ] **PGFPlots:** Second-order step response with steady-state error.
- [ ] **PGFPlots:** Second-order impulse response with steady-state error.
- [ ] **PGFPlots:** Second-order ramp response with steady-state error.
- [ ] **PGFPlots:** Annotated second-order ramp response with steady-state
  error.

### 5.4 Second-Order System-Specific Performance Indicators

- [ ] **PGFPlots:** Underdamped step response annotated with rise time, delay
  time, peak time, peak value, settling time, and tolerance bounds.
- [ ] **PGFPlots:** Peak of a response defined by a zero derivative.
- [ ] **PGFPlots:** Periodicity of the tangent function.
- [ ] **PGFPlots:** Valid and invalid interpretations of second-order settling
  time.
- [ ] **PGFPlots:** Second-order settling time with exponential envelope and
  tolerance band.

## Chapter 6 — System Identification

### Chapter 6 Introduction

No direct LaTeX/TikZ figures identified.

### 6.1 Experimental Signal Processing

- [ ] **PGFPlots:** Digitization of two continuous signals sampled at a fixed
  sampling rate.
- [ ] **PGFPlots:** Aliasing of an inadequately sampled sinusoidal signal.

### 6.2 System Identification for First-Order Systems

- [ ] **PGFPlots:** Experimental first-order response and fitted model.
- [ ] **PGFPlots:** Tangent-at-origin method for estimating a time constant.
- [ ] **PGFPlots:** Half-time method for step and impulse responses.
- [ ] **PGFPlots:** Real-valued upper branch of the Lambert function.

### 6.3 System Identification for Second-Order Systems

- [ ] **PGFPlots:** Experimental second-order response and fitted model.
- [ ] **PGFPlots:** Peak-detection method for estimating damped frequency.
- [ ] **PGFPlots:** Zero-crossing method for estimating damped frequency.
- [ ] **PGFPlots:** Parameter extraction from a second-order step response.
- [ ] **PGFPlots:** Logarithmic decrement measured from a noisy response.
- [ ] **TikZ:** Vehicle wheel, tire, and suspension with equivalent
  spring–mass model.

## Chapter 7 — Control Systems

### 7.1 On–Off Control

- [ ] **TikZ:** On–off controller in a closed feedback loop.

### 7.2 Proportional–Integral–Derivative Control

- [ ] **TikZ:** General PID controller in a closed feedback loop.
- [ ] **PGFPlots:** System and controller responses under PID control.
- [ ] **TikZ:** Proportional controller in a closed feedback loop.
- [ ] **PGFPlots:** System response under proportional control.
- [ ] **TikZ:** Proportional–integral controller in a closed feedback loop.
- [ ] **PGFPlots:** System response under proportional–integral control.
- [ ] **TikZ:** Proportional–derivative controller in a closed feedback loop.
- [ ] **PGFPlots:** System response under proportional–derivative control.

### 7.3 Control Systems

No direct LaTeX/TikZ figures identified.

### 7.4 Stability of Feedback Control Systems and Root Locus

No direct LaTeX/TikZ figures identified.

### 7.5 Stability Criteria

No direct LaTeX/TikZ figures identified.

### 7.6 Feedback Controllers

No direct LaTeX/TikZ figures identified.

### 7.7 Aircraft Roll Motion

No direct LaTeX/TikZ figures identified.

### 7.8 Feedback Controllers, Continued

No direct LaTeX/TikZ figures identified.

### 7.9 Aircraft Roll Motion, Continued

No direct LaTeX/TikZ figures identified.

### 7.10 Instability Suppression with Velocity Feedback

No direct LaTeX/TikZ figures identified.

## Chapter 8 — Frequency Analysis

No direct LaTeX/TikZ figures identified in the chapter source.

## Chapter 9 — Combined Analysis

No direct LaTeX/TikZ figures identified in the chapter source.

## Chapter 10 — Control Systems Designer

No direct LaTeX/TikZ figures identified in the chapter source.

## Chapter 11 — State-Space Representations

No direct LaTeX/TikZ figures identified in the chapter source.

## Chapter 12 — Machine Learning Control

### Chapter 12 Introduction

- [ ] **TikZ:** Simplified control system using a machine-learning controller.
