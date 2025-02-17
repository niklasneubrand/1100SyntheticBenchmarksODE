#!/bin/bash

# Define the two source directories
SOURCE_FOLDER1="RS_IMBI/fast2_V2"
SOURCE_FOLDER2="RS_IMBI/slow2_V2"

# Define the destination folder for the final results
DEST_FOLDER="SyntheticBenchmarks"

# Create the destination folder if it doesn't exist
mkdir -p "$DEST_FOLDER"

# An array holding both source directories
SOURCE_FOLDERS=("$SOURCE_FOLDER1" "$SOURCE_FOLDER2")

# Loop over each source folder
for SRC in "${SOURCE_FOLDERS[@]}"; do
    echo "Processing source directory: $SRC"
    
    # Loop over each template directory within the current source
    for template in "$SRC"/*/; do
        # Get the template name (e.g., Template1, Template2, etc.)
        template_name=$(basename "$template")
        echo "  Processing template: $template_name"
        
        # Create the corresponding template directory in the destination
        mkdir -p "$DEST_FOLDER/$template_name"
        
        # Define the expected subfolder that holds the simulation directories
        SIMULATIONS_SUBFOLDER="$template/RealisticSimulation"
        
        # Check if the Simulations subfolder exists
        if [ -d "$SIMULATIONS_SUBFOLDER" ]; then
            # Loop over each directory within the Simulations subfolder
            for simulation in "$SIMULATIONS_SUBFOLDER"/*/; do

                # get folder name and check if it is a simualtion folder (or results folder)
                simulation_name=$(basename "$simulation")
                if [[ $simulation_name == 0* ]]; then
                    echo "    Skipping folder: $simulation_name (starts with 0)"
                    continue
                fi
                echo "    Copying simulation folder: $simulation_name"
                
                # Destination for this simulation
                DEST_SIM="$DEST_FOLDER/$template_name/$simulation_name"
                mkdir -p "$DEST_SIM"
                
                # copy relevant folders (add PEtab in future)
                cp -r "$simulation/Data" "$DEST_SIM/Data"
                cp -r "$simulation/Models" "$DEST_SIM/Models"

                # copy relevant files
                cp "$simulation/Setup.m" "$DEST_SIM"

                plot_file="${simulation}/${simulation_name}_arPlotFullPage.pdf"
                cp "$plot_file" "$DEST_SIM"

            done
        else
            echo "    Warning: No 'RealisticSimulation' subfolder found in $template_name"
        fi
    done
done

echo "Merging complete. Final results are in '$DEST_FOLDER'."
