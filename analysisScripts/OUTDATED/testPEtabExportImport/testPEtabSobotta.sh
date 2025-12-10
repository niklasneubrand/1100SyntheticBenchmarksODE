#!/bin/bash

# Run the MATLAB function with nohup
nohup matlab-R2021a -r "testPEtabExportImport('../../RS_IMBI/slow2_V2/Sobotta_Frontiers2017'); exit;" </dev/null >PEtab_Sobotta.log 2>&1 &