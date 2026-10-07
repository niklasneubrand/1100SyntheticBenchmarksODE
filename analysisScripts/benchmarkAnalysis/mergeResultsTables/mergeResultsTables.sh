#!/bin/bash

echo "Starting the mergeResultsTables script..."

log_file="mergeResultsTables.log"
nohup matlab-R2021a -r "mergeResultsTables; exit;" > $log_file 2>&1 &