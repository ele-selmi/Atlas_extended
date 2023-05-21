#!/bin/bash
#######################################################
#                                                     # 
# Welcome to ATLAS 13 TeV Open Data C++ framework !!! #
#                                                     #   
#######################################################

echo '1 = create all output directories'
echo '0 = remove all output directories'
read choice

# names of 2 analyses
analysisCollection=("HWWAnalysis" "HZZAnalysis")

# creating the output directory for the Analyses codes
if (( $choice == 1 )) ; then
  for i in {0..1} ; do
    analysisName=${analysisCollection[$i]}
    echo "Creating the directory: Analysis/${analysisName}/Output_${analysisName}"
    mkdir Analysis/${analysisName}/Output_${analysisName}
  done

  echo "Creating the directory for the Plotting code: Plotting/histograms"
  mkdir Plotting/histograms

# removing everything within directories
elif  (( $choice == 0 )) ; then
  for i in {0..1} ; do
    analysisName=${analysisCollection[$i]}
    echo "Removing the directory: Analysis/${analysisName}/Output_${analysisName}"
    rm -rf Analysis/${analysisName}/Output_${analysisName}
  done

  echo "Removing the directory for the Plotting code: Plotting/histograms"
  rm -rf Plotting/histograms

else
     echo "Invalid choice!"
fi

########################