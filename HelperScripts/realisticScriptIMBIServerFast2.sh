#!/bin/bash

# This script is used to run the realistic benchmarks on the IMBI server

## Define the directory of the base models
real_dir=$(pwd)
baseModels_dir="$real_dir/BaseModels"
baseSet="fast2"
baseSet_dir="$baseModels_dir/$baseSet"

## Create the results directory
read -p "Enter the version number of the simulation (e.g. 1): " resultsVersion
modelSet="${baseSet}_V${resultsVersion}"
results_dir="$real_dir/RS_IMBI/$modelSet"
mkdir -p "$results_dir"

# Copy the base models to the results directory
echo "Copying base models..."
cp -r "$baseSet_dir/"* "$results_dir/"


# Set the start seed manually
modelIndex=0

## Run the simulations
echo "Start simulations for problems: $modelSet/"
for folder in "$results_dir"/*/; do
    # Remove the trailing slash from the folder name
    folder=${folder%/}

    # Get the folder name without the path
    folder_name=$(basename "$folder")

    # Return the folder name
    echo "    $folder_name"
    # echo $folder

    # Set the start seed
    modelIndex=$((modelIndex + 1))
    startSeed=$((100000*modelIndex))

    # Run simulations
    nohup matlab-R2021a -r "initRealisticBenchmarks; cd('$folder'); arManyRealisticDesigns(1:50, 'rngSeed', $startSeed); exit();" </dev/null >/dev/null 2>&1 &
done