#!/bin/bash

echo "Calculate RS Features for all benchmarks (synthetic and template)"

nohup matlab-R2021a -r "getAllRSFeatures; exit;" </dev/null >getAllRSFeatures.log 2>&1 &
