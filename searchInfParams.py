import os

# Function to search for a pattern in .def files
def search_inf_in_files(base_dir, pattern, output_file):
    result = []
    
    # Walk through the base directory
    for root, dirs, files in os.walk(base_dir):

        # Skip directories that contain "Results"
        if "Results" in root:
            continue

        # Only proceed if the directory contains "Data" and "RealisticSimulation" in its path
        if not root.endswith("Data") or "RealisticSimulation" not in root:
            continue
        
        # Now we are in a valid Data folder under RealisticSimulation, check for .def files
        # print(f"Scanning directory: {root}")

        for file in files:
            # Check if the file is a .def file
            if file.endswith('.def'):
                file_path = os.path.join(root, file)
                
                # Check if the file contains the specified pattern (e.g., "Inf")
                try:
                    with open(file_path, 'r') as f:
                        content = f.read()
                        if pattern in content:
                            # Extract base_problem and simulated_problem
                            parts = root.split(os.sep)
                            
                            # Ensure the folder structure is as expected
                            if len(parts) >= 4 and parts[-1] == "Data":
                                base_problem = parts[-4]  # Base problem folder
                                simulated_problem = parts[-2]  # Simulated problem folder
                                result.append([base_problem, simulated_problem, file])
                except Exception as e:
                    print(f"Error reading {file_path}: {e}")

    # Write results to a TSV file
    with open(output_file, 'w') as out:
        out.write("base_problem\tsimulated_problem\tfilename\n")
        for row in result:
            out.write("\t".join(row) + "\n")

    print(f"Search complete. Found {len(result)} files with '{pattern}'. Results saved to {output_file}")

# Specify the root directory and output file
base_dir = "./RS_IMBI/slow_VV011"  # Change this to the path of your root folder
pattern = "Inf"  # Change this to the pattern you are looking for
output_file = "foundInfParams_slowVV011.tsv"

# Run the search
search_inf_in_files(base_dir, pattern, output_file)