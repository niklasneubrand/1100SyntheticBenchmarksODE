#!/bin/bash

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

        log_file="localOptimzationRecursive_${folder_name}.log"

        # Run the fits in background and create log file
        nohup matlab-R2021a -r "localOptimizationRecursive('$template_dir'); exit;" > $log_file 2>&1 &
    fi
done
