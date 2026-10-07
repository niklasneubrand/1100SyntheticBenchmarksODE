#!/bin/bash

echo "Collecting results from the separate runs"

log_file="collectAllIdentifyResults.log"
nohup matlab-R2021a -r "collectAllIdentifyResults; exit;" > $log_file 2>&1 &
