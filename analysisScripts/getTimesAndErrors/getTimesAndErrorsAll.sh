#!/bin/bash

echo "Calculate Times and Errors for all benchmarks (synthetic and template)"

nohup matlab-R2021a -r "getTimesAndErrorsAll; exit;" </dev/null >getTimesAndErrorsAll.log 2>&1 &
