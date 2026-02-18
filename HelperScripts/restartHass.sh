#!/bin/bash

# Set the directory for the base models
real_dir=$(pwd)
modelName="Hass_PlosOne2017"
baseModels_dir="$real_dir/BaseModels/fast2/$modelName"
target_dir="$real_dir/RS_IMBI/fast2_V2/$modelName"

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
# nohup matlab-R2021a -r "initRealisticBenchmarks; cd('$target_dir'); arManyRealisticDesigns([1 8 19 22 36 42], 'rngSeed', 1100010); exit();" </dev/null >/dev/null 2>&1 & 
# nohup matlab-R2021a -r "initRealisticBenchmarks; cd('$target_dir'); arManyRealisticDesigns([36 42], 'rngSeed', 1100010); exit();" </dev/null >/dev/null 2>&1 &

# Third round of restarts (RS17 failed to restart twice)
nohup matlab-R2021a -r "initRealisticBenchmarks; cd('$target_dir'); arManyRealisticDesigns([17], 'rngSeed', 1100030, 'calculateRSTemplate', false); exit();" </dev/null >/dev/null 2>&1 &