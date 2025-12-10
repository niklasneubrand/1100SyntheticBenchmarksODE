#!/bin/bash

# Run the MATLAB function with nohup
nohup matlab-R2021a -r "testPEtabExportImport('../../RS_IMBI/slow2_V2/Lucarelli_CellSystems2017'); exit;"  </dev/null >PEtab_Lucarelli.log 2>&1 &