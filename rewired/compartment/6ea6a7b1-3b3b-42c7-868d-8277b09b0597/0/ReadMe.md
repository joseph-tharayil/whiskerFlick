This folder contains the code used to generate the EEG weights files for the rewired circuits. 

1. Run *aunch.sh*  to produce a one-timestep compartment report
2. Run *GetPositions.sh* to interpolate segment positions
3. Run *WriteH5Prelim_eeg.sh* to initialize the weights file used in the majority of simulations. Run *WriteH5Prelim_eeg_lambda.sh* to initialize the weights file with the reference electrode at the lambda point on the skull.
4. Run *electrodeFile/WriteH5_eeg.sh* to calculate the segment weights used in the majority of simulations. Run *WriteH5_eeg_lambda.sh* to calculate the segment weights with the reference electrode at the lambda point on the skull.
