#!/bin/bash

# save name for Results folder
save_name="multistartOptimizationV2_6"

# configs
configs="'atol', 1e-8, 'rtol', 1e-8, 'maxsteps', 1e5, 'add_c', 80, 'MaxIter', 1e5"

# Directory containing the synthetic Lucarelli benchmark folders
base_dir="$(pwd)/../../SyntheticBenchmarks/Merkle_PCB2016"
echo "Processing template directory: $base_dir"

folder_name="Merkle_RS03"
template_dir="${base_dir}/${folder_name}"

log_file="${save_name}_Apply2Projects_${folder_name}.log"

# Run the fits in background and create log file
nohup matlab-R2021a -r "multistartOptimizationMulti('$template_dir', 'CompiledProject', '$save_name', 100, 1, $configs); exit;" > $log_file 2>&1 &

echo "Restarted multistart optimization for Merkle_RS03 in background. Log file: $log_file"