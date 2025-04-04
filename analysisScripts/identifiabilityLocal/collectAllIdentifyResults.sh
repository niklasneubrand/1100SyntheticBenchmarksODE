#!/bin/bash

echo "Collecting results from the separate runs"

nohup matlab-R2021a -r "collectAllIdentifyResults; exit;" </dev/null >/dev/null 2>&1 &
