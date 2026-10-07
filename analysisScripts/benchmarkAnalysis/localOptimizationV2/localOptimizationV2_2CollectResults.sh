#!/bin/bash

echo "Analyze success of local optimization strategies for all benchmarks"
nohup matlab-R2021a -r "localOptimizationV2_2CollectResults; exit;" </dev/null >"localOptimizationV2_2CollectResults.log" 2>&1 &
