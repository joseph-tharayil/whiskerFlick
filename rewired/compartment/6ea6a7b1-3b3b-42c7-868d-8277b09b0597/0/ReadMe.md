This folder contains the code used to generate the EEG weights files for the rewired circuits. 

1. Run *launch.sh*  to produce a one-timestep compartment report
2. Run *GetPositions.sh* to interpolate segment positions
3. Download the file `EEG.h5` from [this Zeonodo repository](https://zenodo.org/records/14419388) and the file `EEG_Lambda.h5` from [this Zenodo repository](https://zenodo.org/records/14442089).
4. Run *WriteH5Prelim_eeg.sh* to initialize the weights file used in the majority of simulations. Run *WriteH5Prelim_eeg_lambda.sh* to initialize the weights file with the reference electrode at the lambda point on the skull.
5. Run *electrodeFile/WriteH5_eeg.sh* to calculate the segment weights used in the majority of simulations. Run *WriteH5_eeg_lambda.sh* to calculate the segment weights with the reference electrode at the lambda point on the skull.
