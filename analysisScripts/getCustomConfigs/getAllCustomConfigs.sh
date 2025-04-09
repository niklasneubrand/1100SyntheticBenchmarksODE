#!/bin/bash

echo "Collecting custom configs from all synthetics benchmarks"

nohup matlab-R2021a -r "getAllCustomConfigs; exit;" </dev/null >/dev/null 2>&1 &
