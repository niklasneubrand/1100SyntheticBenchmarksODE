#!/bin/bash

# save name for Results folder
save_name="multistartOptimizationV2_6"

# configs
configs="'atol', 1e-8, 'rtol', 1e-8, 'maxsteps', 1e5, 'add_c', 80, 'MaxIter', 1e5"

# Directory containing the synthetic Lucarelli benchmark folders
base_dir="$(pwd)/../../SyntheticBenchmarks/Lucarelli_CellSystems2017"
echo "Processing template directory: $base_dir"

# Loop through Lucarelli_RSxx where xx is 10 to 25
for num in $(seq -w 10 25); do
    folder_name="Lucarelli_RS${num}"
    template_dir="${base_dir}/${folder_name}"

    if [ -d "$template_dir" ]; then
        echo "Processing directory: $template_dir"

        log_file="${save_name}_Apply2Projects_${folder_name}.log"

        # Run the fits in background and create log file
        nohup matlab-R2021a -r "multistartOptimizationMulti('$template_dir', 'CompiledProject', '$save_name', 100, 1, $configs); exit;" > $log_file 2>&1 &
        sleep 5  # add a small delay to avoid overwhelming the system
    else
        echo "Skipping $folder_name (directory does not exist)"
    fi
done
