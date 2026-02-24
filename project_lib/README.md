The project_lib folder contains the main matlab functions of the project. It should be added to the matlab path to use the synthetic problem generating algorithm for your own D2D modeling project.

# Contents:
* `Analysis`: Functions related to the scripts in the folder `..\analysisScripts`.
* `BaseModels`: Helper functions to loop over the modeling problems in `..\BaseModels`.
* `Helper`: General helper functions that are useful and needed for the other main functions.
* `Plots`: Function to plot all data and ODE simulations of all simulation conditions for a given modeling project.
* `RS_template`: Functions related to a matlab struct to generate a simulation template based on an existing modeling problem.
* `RealisticSimulation`: Main functions of the synthetic problem generating algorithm. These are based on the code of Egert et Al. (doi: 10.3934/mbe.2023467) which is available with in the Data2Dynamics [code base](https://github.com/Data2Dynamics/d2d/tree/10d06626320f799583c74339c7a5b0050e3cbf39/arFramework3/Advanced/RealisticSimulation)
* `tempScripts`: temporary helper scripts that were needed to fix bugs in an automated way (e.g. for looping over all synthetic problems or similar).
