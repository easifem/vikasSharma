---
name: Space-Time Finite Element Method for Transient and Unconfined Seepage Flow Analysis
tools: [Space-time FEM, Unconfined seepage flow, Moving boundary problem, 2021]
image: https://dm2302files.storage.live.com/y4mKsDXh_B_IR_u1m2rTxkjUUc8onADWAQaCo2qR8shBYr2r9MnOzInQk3S0S1dkvFGLoMlmkmeuTs9fippOfckuDLOzbBAScU0_pfItJ1hHAXfMcFZHFhi0Me4VemrpVSKlki86_y-VCuQtCqlzjCqfj3qOvdc9rLMtd48e3r6WwPFc6laQmF-MnY6ID9TH76S?width=692&height=560&cropmode=none
# description: In this paper, space–time finite element method is developed for solving the unsteady unconfined seepage flow problem. This paper also present the details of a automatic mesh moving technique.
---

# Space-Time Finite Element Method for Transient and Unconfined Seepage Flow Analysis

Authors: Vikas Sharma, Kazunori Fujisawa, Akira Murakami

## Abstract

This paper aims to develop a moving-mesh type Finite Element Method for the computation of the transient unconfined seepage flow through the porous medium. The proposed method is based on the time discontinuous Galerkin Space-Time Finite Element Method (ST/FEM). It solves the seepage problem in the saturated region. The primary unknown in ST/FEM is piezometric pressure. Fluid velocities are derived from the pressure using Darcy's law. Further, an iterative algorithm has been proposed in this paper to implement the proposed method. In each iteration step, the computation domain is updated according to the flow velocity on the phreatic boundary. Subsequently, internal nodes are moved using the mesh moving technique to accommodate the newly updated computation domain. The mesh moving technique, which is discussed in this paper, is based on an elasticity problem. ST/FEM is employed to analyze several unconfined seepage flow problems, and results of steady state solutions are compared with those available in the literature to demonstrate the efficacy of the proposed scheme.

{% include elements/figure.html image="https://dm2302files.storage.live.com/y4m9eZJeizW-L_243adVcUlfp1ah3zC67zxteB1E3Oo0AyyRtOGaA-oY00VlkUi_2TtDLXviwt11DeaQS-qYYEr0QQ3IjRjQLI18LrYKenG_K7-di0BY8SY0O-R2VEuw-6W91NOmhONfInOJ66CQMzCQmY80hurq7UoVlPTt5a-UNyvcnL8sVJomOXP55P6qBUt?width=500&height=500&cropmode=none" caption="Unconfined seepage analysis" %}

{% include elements/button.html link="https://doi.org/10.1016/j.finel.2021.103632" text="Read more" %}