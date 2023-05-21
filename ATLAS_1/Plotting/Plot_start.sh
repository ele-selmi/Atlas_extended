#!/bin/bash
########################################
#
# General plotting script
#
########################################

# names of 12 analyses
analysisCollection=("HWWAnalysis" "HZZAnalysis")

# location of their outputs
outputpath=("../Analysis/Hl4/Output_HWWAnalysis" \
"../Analysis/Hl4/Output_HZZAnalysis")

# begin
echo 'Please input the analysis you'd like to plot'
echo '0 = HWWAnalysis'
echo '1 = HZZAnalysis'

read choice

# check choices
if (( ($choice == 0) || ($choice == 1) )) ; then
    
  analysisName=${analysisCollection[${choice}]}
  echo "Now, choose where to store the ${analysisName} output!"
  echo "If the desire location is ${outputpath[${choice}]}: type 0"
  echo 'If you have a custom location path: type 1'
  read option

  if (($option == 0)); then
    analysisPath=${outputpath[${choice}]}

    # run main command
    root -l -b << EOF
	.L Plotting.cxx+
    	Plotting *m=new Plotting();
	m->SetLumi(10064);
	m->SetOption("$analysisName");
    	m->SetInputLocation("$analysisPath")
    	m->run()
    	.q
EOF

  elif (($option == 1)); then
    echo "Please enter your analysis output path:"
    read analysisPath

    root -l -b << EOF
    	.L Plotting.cxx+
    	Plotting *m=new Plotting();
	m->SetLumi(10064);
    	m->SetOption("$analysisName");
    	m->SetInputLocation("$analysisPath")
    	m->run()
    	.q
EOF

  else
    echo "Invalid option"
  fi


else
     echo "Analysis choice not found"
fi
########################################