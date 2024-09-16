#!/bin/bash

# This script is used to run the realistic benchmarks on the IMBI server

## Define the directory of the base models
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

# Compile base models 
nohup matlab-R2021a -r "initRealisticBenchmarks; cd('$baseSet_dir'); arCompileAllSetups; exit();" </dev/null >/dev/null 2>&1 &
