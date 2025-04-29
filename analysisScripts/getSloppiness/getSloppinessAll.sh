#!/bin/bash

echo "Calculating sloppiness for all benchmarks (synthetic and template)"

nohup matlab-R2021a -r "getSloppinessAll; exit;" </dev/null >/dev/null 2>&1 &
