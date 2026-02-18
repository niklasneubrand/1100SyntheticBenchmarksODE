#!/bin/bash

# Set the directory for the base models
real_dir=$(pwd)
modelName="Sobotta_Frontiers2017"
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

# Zeroth round of restarts (some errors do not seem to be related to the seed. Try again with same seed)
# nohup matlab-R2021a -r "initRealisticBenchmarks; cd('$target_dir'); arManyRealisticDesigns(47, 'rngSeed', 1500000, 'calculateRSTemplate', false); exit();" </dev/null >/dev/null 2>&1 &
# nohup matlab-R2021a -r "initRealisticBenchmarks; cd('$target_dir'); arManyRealisticDesigns(48, 'rngSeed', 1500000, 'calculateRSTemplate', false); exit();" </dev/null >/dev/null 2>&1 &
# nohup matlab-R2021a -r "initRealisticBenchmarks; cd('$target_dir'); arManyRealisticDesigns(49, 'rngSeed', 1500000, 'calculateRSTemplate', false); exit();" </dev/null >/dev/null 2>&1 &


# First round of restarts
# nohup matlab-R2021a -r "initRealisticBenchmarks; cd('$target_dir'); arManyRealisticDesigns(14, 'rngSeed', 1500010, 'calculateRSTemplate', false); exit();" </dev/null >/dev/null 2>&1 &
# nohup matlab-R2021a -r "initRealisticBenchmarks; cd('$target_dir'); arManyRealisticDesigns(50, 'rngSeed', 1500010, 'calculateRSTemplate', false); exit();" </dev/null >/dev/null 2>&1 &

# Second round of restarts
nohup matlab-R2021a -r "initRealisticBenchmarks; cd('$target_dir'); arManyRealisticDesigns(43, 'rngSeed', 1500020, 'calculateRSTemplate', false); exit();" </dev/null >/dev/null 2>&1 &