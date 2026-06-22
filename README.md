# MATLAB IVP Methods Comparison

## Overview

This repository presents a comparative study of numerical methods used to solve Initial Value Problems (IVPs) for ordinary differential equations in MATLAB.

The project implements multiple numerical techniques and evaluates their accuracy through error analysis, graphical comparisons, and convergence studies. The numerical solutions are compared against the exact analytical solution to assess the performance of each method.

This project was developed as part of an engineering numerical methods portfolio and demonstrates practical applications of computational techniques used in engineering analysis and simulation.

---

## Problem Statement

Solve the following initial value problem:

$$
\frac{dy}{dt}=te^{3t}-2y
$$

with

$$
y(0)=0
$$

over the interval

$$
0 \le t \le 1
$$

using a fixed step size

$$
h=0.1
$$

The exact analytical solution is:

$$
y(t)=\frac{1}{25}\left[(5t-1)e^{3t}+e^{-2t}\right]
$$

---

## Methods Implemented

The following numerical methods were implemented and compared:

* Euler Method
* Taylor Method (Order 2)
* Taylor Method (Order 3)
* Midpoint Method
* Modified Euler Method
* Runge-Kutta Fourth Order Method (RK4)

Each implementation computes:

* Numerical solution
* Exact solution
* Absolute error
* Graphical comparison

---

## Repository Structure

```text
MATLAB-IVP-Methods-Comparison
│
├── euler_method.m
├── taylor_method_order2.m
├── taylor_method_order3.m
├── midpoint_method.m
├── modified_euler_method.m
├── rk4_method.m
│
├── comparison_script.m
├── convergence_study.m
│
├── figures
│   ├── euler_graph.png
│   ├── taylor_order2_graph.png
│   ├── taylor_order3_graph.png
│   ├── midpoint_graph.png
│   ├── modified_euler_graph.png
│   ├── rk4_graph.png
│   ├── comparison_graph.png
│   └── convergence_study.png
│
├── IVP_Methods_Comparison_Report.pdf
│
└── README.md
```

---

## Results Summary

The methods were compared using the numerical solution at (t = 1).

| Method         | Final Numerical Value | Exact Value | Absolute Error |
| -------------- | --------------------: | ----------: | -------------: |
| Euler          |                2.7609 |      3.2191 |         0.4582 |
| Taylor Order 3 |                3.2140 |      3.2191 |         0.0051 |
| Midpoint       |                3.2254 |      3.2191 |         0.0063 |
| Modified Euler |                3.2979 |      3.2191 |         0.0788 |
| RK4            |                3.2193 |      3.2191 |         0.0002 |

### Accuracy Ranking

1. RK4 Method
2. Taylor Method Order 3
3. Midpoint Method
4. Modified Euler Method
5. Euler Method

The RK4 Method achieved the highest accuracy, while the Euler Method produced the largest error.

---

## Convergence Study

A convergence study was performed using the following step sizes:

* h = 0.20
* h = 0.10
* h = 0.05
* h = 0.025

The results demonstrate that:

* Numerical error decreases as the step size decreases.
* Higher-order methods converge more rapidly.
* RK4 exhibits the fastest convergence rate.
* Euler Method requires significantly smaller step sizes to achieve comparable accuracy.

---

## Engineering Applications

Numerical solution methods for differential equations are fundamental to many engineering disciplines, including:

* Mechanical System Simulation
* Robotics and Mechatronics
* Control Systems Engineering
* Heat Transfer Analysis
* Fluid Mechanics
* Aerospace Engineering
* Electrical Circuit Modeling
* Dynamic System Analysis

These techniques form the foundation of many engineering simulation and computational analysis tools.

---

## Skills Demonstrated

* MATLAB Programming
* Numerical Analysis
* Ordinary Differential Equations
* Initial Value Problem Solving
* Error Analysis
* Convergence Analysis
* Data Visualization
* Engineering Computation
* Technical Documentation

---

## Future Improvements

Potential extensions of this project include:

* Adaptive Step-Size Methods
* Higher-Order Taylor Methods
* Systems of Differential Equations
* Comparison with MATLAB Built-In Solvers (`ode45`, `ode23`)
* MATLAB App Designer Interface
* Stiff Differential Equation Solvers

---

## Author

**Ehsan Shakil Ahmad**

Mechanical Engineering Student
National University of Sciences and Technology (NUST)

Interests:

* Robotics
* Mechatronics
* Computational Engineering
* Numerical Methods
* Engineering Simulation
