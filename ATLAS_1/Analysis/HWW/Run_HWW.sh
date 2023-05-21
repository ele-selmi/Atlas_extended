!/bin/bash
## script to run the analysis

analysis=“HWW_Analysis” 

# calling and starting ROOT
echo “ ROOT is getting started”

root -l -b <<EOF

## ROOT will be run in line and batch mode until the EOF command is met

.L $analysis.C+
## The analysis.C file will be loaded and compile as a shared library

EOF

##
echo “End of execution"