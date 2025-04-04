import os
import re

# Function to search for a pattern in .m files
def search_inf_in_files(base_dir, pattern, output_file):
    result = []
    # Regular expression to capture "ar.config.add_c = <2-3 digit number>"
    regex = re.compile(r"ar\.config\.add_c\s*=\s*(\d{2,3})")
    
    # Walk through the base directory
    for root, dirs, files in os.walk(base_dir):
        # Skip directories that contain "Results"
        if "Results" in root:
            continue

        # Only proceed if the directory ends with "RealisticSimulation\xxx"
        parts = root.split(os.sep)
        if len(parts) < 3 or parts[-2] != "RealisticSimulation":
            continue
        
        # Now we are in a valid Data folder under RealisticSimulation, check for Setup*.m files
        for file in files:
            # Check if the file name starts with "Setup" and ends with ".m"
            if file.startswith("Setup") and file.endswith(".m"):
                file_path = os.path.join(root, file)
                
                # Check if the file contains the specified pattern with a 2-3 digit value
                try:
                    with open(file_path, 'r') as f:
                        for line in f:
                            match = regex.search(line)
                            if match:
                                # Extract base_problem, simulated_problem, and the numeric value
                                base_problem = parts[-3]  # Base problem folder
                                simulated_problem = parts[-1]  # Simulated problem folder
                                value = match.group(1)  # Extracted 2-3 digit value
                                result.append([base_problem, simulated_problem, file, value])
                                break  # Stop reading further lines in this file once the pattern is found
                except Exception as e:
                    with open("error_log.txt", "a") as log_file:
                        log_file.write("Error reading {}: {}\n".format(file_path, e))

    # Write results to a TSV file
    with open(output_file, 'w') as out:
        out.write("base_problem\tsimulated_problem\tfilename\tvalue\n")
        for row in result:
            out.write("\t".join(row) + "\n")

    print("Search complete. Found {} files with '{}'. Results saved to {}".format(len(result), pattern, output_file))

# Specify the root directory and output file

pattern = "ar.config.add_c = *"  # Updated pattern description
base_names = ["fast2_V1", "slow2_V1"]

for base_name in base_names:
    base_dir = "./RS_IMBI/{}".format(base_name)  # Change this to the path of your root folder
    output_file = "foundCustomAddC_{}.tsv".format(base_name)

    # Run the search
    search_inf_in_files(base_dir, pattern, output_file)
