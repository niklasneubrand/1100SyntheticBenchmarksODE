#!/bin/bash

echo "Calculating multistart metrics for all benchmarks (synthetic and template)"

nohup matlab-R2021a -r "analyseMultistartAll('multistartOptimizationV2_6'); exit;" </dev/null >analyseMultistartAllV2_6.log 2>&1 &