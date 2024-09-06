#!/bin/bash

# This script is used to run the realistic benchmarks on the IMBI server

real_dir=$(pwd)
results_dir="$real_dir/RS_IMBI/all_fast_V3"

## Run the simulations
echo "Start simulations for problems:"

# Remove the trailing slash from the folder name
folder="$results_dir/Bruno_Carotines_JExpBio2016"
folder=${folder%/}

# Get the folder name without the path
folder_name=$(basename "$folder")

# Return the folder name
echo "    $folder_name"
# echo $folder

# Collect Data by calling MATLAB script lhsLogging.m
nohup matlab-R2021a -r "initRealisticBenchmarks; cd('$folder'); arManyRealisticDesigns(1:50); exit();" </dev/null >/dev/null 2>&1 &
