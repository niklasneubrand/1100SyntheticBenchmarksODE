#!/bin/bash

echo "Calculating sloppiness for all benchmarks (synthetic and template)"
nohup matlab-R2021a -r "getSloppinessAll('localOptimizationV2_4'); exit;" </dev/null >getSloppinessV2_4.log 2>&1 &