#!/bin/bash

# This script is used to run the realistic benchmarks on the IMBI server

## Define the directory of the bas models
real_dir=$(pwd)
baseModels_dir="$real_dir/BaseModels"

# List available base sets
echo "Available base sets:"
base_sets=($(ls -d $baseModels_dir/*/ | xargs -n 1 basename))
for base_set in "${base_sets[@]}"; do
    echo "  - $base_set"
done

# User input to pick one base set
read -p "Enter the name of the base set from the above options: " baseSet
baseSet_dir="$baseModels_dir/$baseSet"

# Check if the entered base set exists
if [[ ! " ${base_sets[@]} " =~ " ${baseSet} " ]]; then
    echo "Error: The entered base set does not exist. Please rerun the script and enter a valid base set."
    exit 1
fi


## Create the results directory
read -p "Enter the version number of the simulation (e.g. 1): " resultsVersion
modelSet="${baseSet}_V${resultsVersion}"
results_dir="$real_dir/RS_IMBI/$modelSet"
mkdir -p "$results_dir"

# Copy the base models to the results directory
echo "Copying base models..."
cp -r "$compiled_dir/"* "$results_dir/"


## Run the simulations
echo "Start simulations for problems: $modelSet/"
for folder in "$results_dir"/*/; do
    # Remove the trailing slash from the folder name
    folder=${folder%/}

    # Get the folder name without the path
    folder_name=$(basename "$folder")

    # Skip the folders starting with '0'
    if [[ $folder_name == 0* ]]; then
        continue
    fi

    # Return the folder name
    echo "    $folder_name"
    # echo $folder
	
    # Collect Data by calling MATLAB script lhsLogging.m
    nohup matlab-R2021a -r "initRealisticBenchmarks; cd('$folder'); arManyRealisticDesigns(1:50); exit();" </dev/null >/dev/null 2>&1 &
done