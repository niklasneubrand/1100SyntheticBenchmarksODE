#!/bin/bash

echo "Calculating sloppiness for all benchmarks (synthetic and template)"

nohup matlab-R2021a -r "getSloppinessAll('localOptimizationV2_2'); exit;" </dev/null >getSloppinessV2_2.log 2>&1 &
