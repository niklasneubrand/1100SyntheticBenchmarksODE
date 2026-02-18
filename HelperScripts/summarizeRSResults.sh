#!/bin/bash

nohup matlab-R2021a -r "initRealisticBenchmarks; summarizeRSResults(); exit();" </dev/null >/dev/null 2>&1 &