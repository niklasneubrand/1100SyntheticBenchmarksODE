#!/bin/bash

# Set the directory for the base models
real_dir=$(pwd)
modelName="Isensee_JCB2018"
target_dir="$real_dir/RS_IMBI/slow2_V2/$modelName"

# Extract the prefix (e.g., "Isensee") from modelName
model_prefix=${modelName%%_*}

# Define failed simulations from the report
failed_simulations=(2 17 33 37 41 49)

# Directory for storing failed simulations
failed_dir="$target_dir/RealisticSimulation/0_failed_RS"
mkdir -p "$failed_dir"

# Restart each failed simulation
for sim in "${failed_simulations[@]}"; do
    # Prepend 0 to single-digit simulation numbers
    sim_formatted=$(printf "%02d" $sim)

    # Define source and destination paths for failed simulation
    sim_dir="$target_dir/RealisticSimulation/${model_prefix}_RS${sim_formatted}"
    failed_sim_dir="$failed_dir/${model_prefix}_RS${sim_formatted}_failed_2"
    
    # Check if the folder exists before proceeding
    if [ -d "$sim_dir" ]; then
        echo "Renaming and moving $sim_dir to $failed_sim_dir..."
        mv "$sim_dir" "$failed_sim_dir"
    else
        echo "Warning: Directory $sim_dir does not exist. Skipping renaming."
    fi
    
    echo "Restarting failed simulation ${model_prefix}_RS${sim_formatted} with updated seed and parameters..."
    
    # Submit MATLAB restart job
    nohup matlab-R2021a -r "initRealisticBenchmarks; cd('$target_dir'); arManyRealisticDesigns(${sim}, 'rngSeed', 2000020, 'calculateRSTemplate', false); exit();" </dev/null >/dev/null 2>&1 &
done

echo "All failed simulations have been renamed, moved, and prepared for resubmission."
