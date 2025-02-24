#!/bin/bash

# Directory containing the synthetic benchmark folders
base_dir="$(pwd)/../../SyntheticBenchmarks"
echo "Processing base directory: $base_dir"

# Loop through all synthetic projects folders in the template directory
for template_dir in "$base_dir"/*/; do
    if [ -d "$template_dir" ]; then
        echo "Processing directory: $template_dir"

        folder_name=$(basename "$template_dir")
        
        # Run the identifiability analysis in the background
        nohup matlab-R2021a -r "diary(sprintf('%s_recursiveTest.log', '$folder_name')); testIdentifyLocalRecursive('$template_dir'); diary('off'); exit;" </dev/null >/dev/null 2>&1 &
    fi
done