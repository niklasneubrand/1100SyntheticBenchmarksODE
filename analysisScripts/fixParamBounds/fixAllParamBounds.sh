#!/bin/bash

echo "Fixing Parameter bounds for all synthetics benchmarks"
nohup matlab-R2021a -r "fixAllParamBounds; exit;" </dev/null >fixAllParamBounds.log 2>&1 &
