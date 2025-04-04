#!/bin/bash

# Define base directories (i.e. folder containing the synthetic projects)
base_dir1="$(pwd)/../../RS_IMBI/fast2_V2"
base_dir2="$(pwd)/../../RS_IMBI/slow2_V2"
base_dirs=("$base_dir1" "$base_dir2")

# List of projects with DR data
has_DRdata_list=("Bachmann_MSB2011" "Brannmark_JBC2010" "Hass_PlosOne2017" "Isensee_JCB2018" "Lucarelli_CellSystems2017" "Merkle_PCB2016" "Sobotta_Frontiers2017")


# Loop through all base directories
for base_dir in "${base_dirs[@]}"; do
    echo "Processing base directory: $base_dir"

    # Loop through all synthetic projects folders in the current base directory
    for template_dir in "$base_dir"/*/; do
        if [ -d "$template_dir" ]; then

            # Remove trailing slash from the template_dir path
            template_dir="${template_dir%/}"
            folder_name=$(basename "$template_dir")

            # Check if the folder name is in the list of projects with DR data
            if [[ ! " ${has_DRdata_list[@]} " =~ " ${folder_name} " ]]; then
                echo "Skipping directory: $template_dir (no DR data -> needs no fix)"
                continue
            fi

            echo "Processing directory: $template_dir"

            # Run the identifiability analysis in the background
            nohup matlab-R2021a -r "diary(sprintf('recursiveDRfix_%s.log', '$folder_name')); fixDRrecursive('$template_dir'); diary('off'); exit;" </dev/null >/dev/null 2>&1 &
        fi
    done
done
