#!/bin/bash

# Set the directory for the base models
real_dir=$(pwd)
modelName="Merkle_PCB2016"
baseModels_dir="$real_dir/BaseModels/slow2/$modelName"
target_dir="$real_dir/RS_IMBI/slow2_V2/$modelName"

# Copy the model to the target directory
# echo "Copying base models from $baseModels_dir to $target_dir..."
# mkdir -p "$target_dir"
# cp -r "$baseModels_dir/"* "$target_dir/"
# echo "Copy complete."

# Compile model on current machine
# echo "compiling base model"
# matlab-R2021a -r "initRealisticBenchmarks; cd('$target_dir'); Setup; arSave('normal'); exit();" > "$target_dir/compileBaseModel.log" 2>&1
# echo "compiled successfully"


# First round of restarts
nohup matlab-R2021a -r "initRealisticBenchmarks; cd('$target_dir'); arManyRealisticDesigns(5, 'rngSeed', 2200010); exit();" </dev/null >/dev/null 2>&1 &
