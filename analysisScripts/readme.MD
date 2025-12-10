This folder cotains all scripts to analyze the synthetic benchmark problems.
This includes:
* Problem characteristics: "getAllRSFeats" and "getTimesAndErrors"
* Identifiability: "localOptimizationV2" and "identifiabilityLocal"
* Multistart: "multistartOptimization"

To merge all results in one large feature table, apply the scripts from "mergeResultsTables".

The folder "OUTDATED" contains:
* outdated analysis scripts (e.g. localOptimization)
* scripts that were applied to fix bugs and test new features during the creation of the final benchmarking collection. They are not needed anymore.
To run scripts from this folder, you probably have to move them back to the main "analysisScipts" folder to have correct dependencies.