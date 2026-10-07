The project_lib folder contains the main matlab functions of the project. It should be added to the matlab path to use the synthetic problem generating algorithm for your own D2D modeling project.

# Contents:
* `Analysis`: Functions related to the scripts in the folder `../analysisScripts`.
* `BaseModels`: Helper functions to loop over the modeling problems in `../BaseModels`.
* `Helper`: General helper functions that are useful and needed for the other main functions.
* `Plots`: Function to plot all data and ODE simulations of all simulation conditions for a given modeling project.
* `RS_Template`: Functions related to a MATLAB struct used to generate a simulation template based on an existing modeling problem.
* `RealisticSimulation`: Main functions of the synthetic problem-generation algorithm. These are based on the code of Egert et al. (doi: 10.3934/mbe.2023467), which is available within the Data2Dynamics [code base](https://github.com/Data2Dynamics/d2d/tree/10d06626320f799583c74339c7a5b0050e3cbf39/arFramework3/Advanced/RealisticSimulation).
