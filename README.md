# 1100 Synthetic Benchmark Problems for Dynamic Modeling of Cellular Processes

We present a collection of 1,100 synthetic benchmark problems generated using a realistic simulation method based on 22 published modeling problems from systems biology. The manuscript has been accepted for publication in *Bioinformatics Advances*; publication details will be added when available. This repository contains the ready-to-use benchmark problems and the algorithm for generating new synthetic benchmarks, including from user-provided modeling problems.

## Contents:
* `BaseModels/`: Data2Dynamics (D2D) implementations of the 22 published model templates, grouped into `fast2/` and `slow2/` according to their computational requirements.
* `Examples/1_Creating_Synthetic_Benchmark/`: an example showing how to use the problem-generation algorithm with one of the provided template problems. The example script is `exampleBenchmarkGeneration.m`.
* `SyntheticBenchmarks/`: the collection of 1,100 synthetic benchmark problems in D2D format.
* `SyntheticBenchmarks_PEtab/`: the benchmark problems exported to the PEtab model-exchange format. These files were generated automatically using D2D export functions and have not been manually checked; some problems may not work correctly in this format.
* `analysisScripts/`: scripts and functions for further analyses of the benchmark models, including parameter-estimation and identifiability analyses. It is organized into `benchmarkAnalysis/`, `paperFiguresAndTables/`, and `supplementary/`.
* `project_lib/`: MATLAB code for generating new synthetic problems. Its main components are `Analysis/`, `BaseModels/`, `Helper/`, `Plots/`, `RS_Template/`, and `RealisticSimulation/`.
* `initRealisticBenchmarks.m`: MATLAB setup script that adds the problem-generation code in `project_lib/` to the MATLAB path for the current session. Data2Dynamics is required.

## Installation and usage:
1. Install MATLAB R2021a or later.
2. Install the Data2Dynamics modeling toolbox (see: https://github.com/Data2Dynamics/d2d/wiki/Installation)
3. Open MATLAB, navigate to the repository root, and run `initRealisticBenchmarks.m` to add the problem-generation code to the path for the current session.
4. Go to a D2D project folder and compile or load a model.
5. Run `arNewRealisticDesign` or `arManyRealisticDesigns` to generate one or more new benchmark problems. Use the documented name-value arguments to control the output (e.g. random seeds, names, and flags).

## Citation

If you use the code or benchmark problems, please cite the associated publication:

> Neubrand et al. 1100 Synthetic Benchmark Problems for Dynamic Modeling of Cellular Processes. *Bioinformatics Advances*. Publication details to be added.
