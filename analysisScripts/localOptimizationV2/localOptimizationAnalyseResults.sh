#!/bin/bash

echo "Analze success of local optimization strategies for all benchmarks"
nohup matlab-R2021a -r "localOptimizationAnalyseResults; exit;" </dev/null >"localOptimizationAnalyseResults.log" 2>&1 &
