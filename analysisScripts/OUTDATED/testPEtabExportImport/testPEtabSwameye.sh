#!/bin/bash

# Run the MATLAB function with nohup and log output to a file
nohup matlab-R2021a -r "testPEtabExportImport('../../RS_IMBI/fast2_V2/Swameye_PNAS2003'); exit;" </dev/null >PEtab_Swameye.log 2>&1 &