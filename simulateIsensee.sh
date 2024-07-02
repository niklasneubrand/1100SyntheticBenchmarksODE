# bash script to do the simulations of the Isensee model

folder=$(pwd)
folder="$folder/RS_IMBI/all_no_Chen_V1/Isensee_JCB2018"

# lcreate a loop with index 1 to 50
for i in {8..50}
do
    # Collect Data by calling MATLAB script lhsLogging.m
    nohup matlab-R2021a -r "initRealisticBenchmarks; cd('$folder'); simulateIsensee($i); exit();" </dev/null >/dev/null 2>&1 &
done