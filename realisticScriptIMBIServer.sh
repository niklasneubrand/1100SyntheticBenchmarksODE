#!/bin/bash

# This script is used to run the realistic benchmarks on the IMBI server

# Define the base directory
real_dir=$(pwd)
baseSet="all_lhsok"
baseSet_dir="$real_dir/BaseModels/$baseSet"

# Create the results directory
read -p "Enter the version number of the simulation (e.g. 1): " resultsVersion
modelSet="${baseSet}_V${resultsVersion}"
results_dir="$real_dir/RS_IMBI/$modelSet"
mkdir -p "$results_dir"

# Copy the base models to the results directory
echo "Copying base models..."
cp -r "$compiled_dir/"* "$results_dir/"

echo "Start simulations for problems: $modelSet/"

# Loop over all model folders in the modelSet directory
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