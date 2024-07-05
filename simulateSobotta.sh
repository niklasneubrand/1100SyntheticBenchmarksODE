# bash script to do the simulations of the Isensee model

folder=$(pwd)
folder="$folder/RS_IMBI/slow_V2/Sobotta_Frontiers2017"

# lcreate a loop with index 1 to 50
for i in {1..50}
do
    # Collect Data by calling MATLAB script lhsLogging.m
    nohup matlab-R2021a -r "initRealisticBenchmarks; cd('$folder'); arSlowRealisticDesign($i); exit();" </dev/null >/dev/null 2>&1 &
done