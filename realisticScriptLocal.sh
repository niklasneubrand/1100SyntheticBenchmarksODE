#!/bin/bash

# This script is used to run the realistic benchmarks on the IMBI server

# define the directories
real_dir=$(pwd)
baseSet=all_lhsok
baseSet_dir=$real_dir/BaseModels/$baseSet

# user input for the results folder
echo "Enter the name of the results folder: "
read resultsVersion

# define the results directory
modelSet=$baseSet"V"$resultsVersion
reults_dir=$real_dir/RS_local/$modelSet

# check if a compiled version of the model exists
# to do this check if the folder $modelSet_dir"_compiled" exists
if [ -d $baseSet_dir"_compiled" ]; then
    # if the folder exists, copy the compiled models to the Results folder
    cp -r $baseSet_dir"_compiled" $results_dir
else
    # if the folder does not exist, compile the models
    # compile the models and copy them with "arCompileBaseModels.m"
    matlab-R2021a -r "initRealisticBenchmarks; arCompileBaseModels('$baseSet_dir', '$results_dir'); exit;"
fi


## Run the Simulations for each model

echo "jobs submitted: " $modelSet"/"

# Loop over all model folders in the modelSet directory
for folder in "$reults_dir"/*/; do

    # Remove the trailing slash from the folder name
    folder=${folder%/}

    # Get the folder name without the path
    folder_name=$(basename "$folder")

    # Skip the folders starting with '0'
    if [[ $folder_name == 0* ]]; then
        continue
    fi

    # Return the folder name
    echo "    "$folder_name

    # Collect Data by calling MATLAB script lhsLogging.m
    nohup matlab-R2021a -r "initRealisticBenchmarks; cd('$folder'); arManyRealisticDesigns(1:20); exit();" </dev/null >/dev/null 2>&1 &

done