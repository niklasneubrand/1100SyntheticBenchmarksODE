#!/bin/bash

# save name for Results folder
savename="localOptimization_V1"

# Directory containing the synthetic benchmark folders
base_dir="$(pwd)/../../SyntheticBenchmarks"
echo "Processing base directory: $base_dir"

# Loop through all synthetic projects folders in the template directory
for template_dir in "$base_dir"/*/; do
    if [ -d "$template_dir" ]; then
    
        # Remove trailing slash from the template_dir path
        template_dir="${template_dir%/}"
        folder_name=$(basename "$template_dir")
        echo "Processing directory: $template_dir"

        log_file="${saveName}_Apply2Projects_${folder_name}.log"

        # Run the fits in background and create log file
        nohup matlab-R2021a -r "localOptimizationMulti('$template_dir', 'Final', '$savename'); exit;" > $log_file 2>&1 &
        sleep 5  # add a small delay to avoid overwhelming the system
    fi
done

# run fits for template models in the background and create log file
log_file_fast2="${saveName}_Apply2Projects_fast2.log"
log_file_slow2="${saveName}_Apply2Projects_slow2.log"
fast2Dir="$(pwd)/../../RS_IMBI/fast2_V2"
slow2Dir="$(pwd)/../../RS_IMBI/slow2_V2"

nohup matlab-R2021a -r "localOptimizationMulti('$fast2Dir', 'normal', '$savename'); exit;" > $log_file_fast2 2>&1 &
sleep 5  # add a small delay to avoid overwhelming the system
nohup matlab-R2021a -r "localOptimizationMulti('$slow2Dir', 'normal', '$savename'); exit;" > $log_file_slow2 2>&1 &