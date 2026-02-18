#!/bin/bash

# Set the directory for the base models
real_dir=$(pwd)
modelName="Sobotta_Frontiers2017"
baseModels_dir="$real_dir/BaseModels/slow2/$modelName"
target_dir="$real_dir/RS_IMBI/slow2_V2/$modelName"

# Copy the model to the target directory
echo "Copying base models from $baseModels_dir to $target_dir..."
mkdir -p "$target_dir"
cp -r "$baseModels_dir/"* "$target_dir/"
echo "Copy complete."

# Compile model on current machine
echo "compiling base model"
matlab-R2021a -r "initRealisticBenchmarks; cd('$target_dir'); Setup; arSave('normal'); exit();" > "$target_dir/compileBaseModel.log" 2>&1
echo "compiled successfully"

# Set initial model index and seed base
modelIndex=15
seed_base=100000
startSeed=$((seed_base * modelIndex))

# Set the number of batches and simulations per batch
total_batches=10
simulations_per_batch=5

# Loop through batches
for batch in $(seq 1 $total_batches); do

    # Calculate the starting and ending numbers for the current batch
    start_simulation=$(( (batch - 1) * simulations_per_batch + 1))
    end_simulation=$(( batch * simulations_per_batch))
    
	echo "Starting batch $batch of $total_batches ($start_simulation:$end_simulation)"
	
    # Run MATLAB simulation with the specified seed and range
    nohup matlab-R2021a -r "initRealisticBenchmarks; cd('$target_dir'); arManyRealisticDesigns($start_simulation:$end_simulation, 'rngSeed', $startSeed); exit();" </dev/null >/dev/null 2>&1 &
done
