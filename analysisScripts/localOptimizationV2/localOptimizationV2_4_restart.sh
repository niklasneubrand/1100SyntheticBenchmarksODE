#!/bin/bash

# List of templates to restart for variant V4
restart_templates=("Beer" "Lucarelli" "Merkle" "Sobotta" "Zheng")

# save name for Results folder
save_name="localOptimizationV2_4"

# configs
configs="'atol', 1e-8, 'rtol', 1e-8, 'maxsteps', 1e6, 'add_c', 80, 'MaxIter', 1e5, 'TolFun', 1e-6"

# Directory containing the synthetic benchmark folders
base_dir="$(pwd)/../../SyntheticBenchmarks"
echo "Processing base directory: $base_dir"

# Loop through all synthetic projects folders in the template directory
for template_dir in "$base_dir"/*/; do
    if [ -d "$template_dir" ]; then
    
        # Remove trailing slash from the template_dir path
        template_dir="${template_dir%/}"
        folder_name=$(basename "$template_dir")

        # Check if the folder name starts with any of the restart_templates
        match_found=false
        for template in "${restart_templates[@]}"; do
            if [[ "$folder_name" == "$template"* ]]; then
            match_found=true
            break
            fi
        done

        if [ "$match_found" = false ]; then
            continue
        fi
        echo "Processing directory: $template_dir"

        log_file="${save_name}_Apply2Projects_${folder_name}.log"

        # Run the fits in background and create log file
        nohup matlab-R2021a -r "localOptimizationV2Multi('$template_dir', 'CompiledProject', '$save_name', $configs); exit;" > $log_file 2>&1 &
        sleep 5  # add a small delay to avoid overwhelming the system
    fi
done