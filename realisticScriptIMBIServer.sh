#!/bin/bash

# define the directories
script_dir=$(pwd)
modelSet=fast10
modelSet_dir=$script_dir/Benchmark_Models/$modelSet

echo "jobs submitted:"

# Loop over all model folders in the modelSet directory
for folder in $modelSet_dir/*/; do

    # Remove the trailing slash from the folder name
    folder=${folder%/}

    # Get the folder name without the path
    folder_name=$(basename "$folder")

    # Skip the folders staring with '0'
    #if [[ $folder_name == 0* ]]; then
    #    continue
    #fi

    # Return the folder name
    echo "    "$folder_name

    # Collect Data by calling MATLAB script lhsLogging.m
    nohup matlab-R2021a -r "initRealisticBenchmarks; cd('$folder'); arManyRealisticDesigns(1:20); exit()" </dev/null >/dev/null 2>&1 &

done