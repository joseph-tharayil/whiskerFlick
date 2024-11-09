# Computational modeling reveals biological mechanisms underlying the whisker-flick EEG

This repository contains the code used in the paper "Computational modeling reveals biological mechanisms underlying the whisker-flick EEG". 
We simulate EEG signals from two versions ("original" and "Schneider-Mizell", respectively) of the Blue Brain Project's models of the rat non-barrel primary somatosensory cortex (nbS1), under a variety of conditions.
It relies on the BlueRecording workflow described in [this paper](https://www.biorxiv.org/content/10.1101/2024.05.14.591849v1) and [this repo]((github.com/BlueBrain/BlueRecording)).
Briefly, for each of the neural circuits, we generate a "weights file" that describes how the transmembrane current in each neural compartment contributes to the EEG. We then simulate the EEG under a variety of conditions.

## Prerequisites

We assume that you are running this code on a Linux system with slurm and the spack package manager. This software has not been tested on any other system. 
Install Neurodamus and BlueRecording according to the instructions in the [BlueRecording repository](github.com/BlueBrain/BlueRecording). This repo assumes that your system meets the requirements described there.

## Detailed instructions

### Download models
Download the model data for the original circuit from this [Zenodo repository](https://zenodo.org/records/11113043) and extract it into the `original_circuit_config` folder. Ensure that you use the .asc morphologies.
Copy the model data into the `rewired_circuit_config` folder. Then replace the edges.h5 file with the version from this [Zenodo repository](https://zenodo.org/records/11108303).

### Generating the EEG weights files

#### Original circuit

To generate the EEG weights file for the original circuit, clone the [BlueRecording repository](github.com/BlueBrain/BlueRecording) into the parent folder of this repository (to ensure that relative paths work as expected), and follow the instructions [here](https://github.com/BlueBrain/BlueRecording/tree/main/examples/whiskerFlick#readme), up to step 4. 

#### Schneider-Mizell circuit

To generate the EEG weights file for the SM circuit, follow the instructions [here](https://github.com/joseph-tharayil/whiskerFlick/rewired/compartment/6ea6a7b1-3b3b-42c7-868d-8277b09b0597/0/)

### Running simulations

The simulations in this repo are organized into "simulation campaigns". Each simulation campaign has 10 subfolders, each corresponding to a simulation with a different random seed.

The simulation campaigns in the folder `original` refer to the unmodified nbS1 circuit. The simulation campaigns in the folder `rewired` refer to the nbS1 circuit rewired to incorporate information from the MiCrONS dataset. We refer to this circuit as the Scneider-Mizell (SM) circuit.

First, we run the simulations in the campaigns `rewired/97d6aa07-db02-48c6-91c2-b3023ce5bdd0` and `original/fixed/a9f782a3-1f22-4384-a122-430bc6b2323c`. These are the simulations with full cortico-cortical connectivity, and with thalamic input replayed into the circuit.

To run the simulations, navigate to each simulation folder and launch the `launch.sh` script.
Once the simulations are complete, postprocess data by launching the `Geteeg.sh` script in the campaign folder. 

#### Effects of reference electrode position
To investigate the impact of changing the position of the reference electrode on the EEG signal, run the campaign in `rewired/testReference`.

#### EEG contributions from specific presynaptic populations
To calculate the contribution of presynaptic populations to the EEG signal, we create "spike input files" which list the spike times of the cortical cells from the fully-connected circuits described in the previous section, excluding the spikes from the populations of interest.
To generate these spike input files, run the script `EditSpikeFile.sh`
We then replay these spike files, along with the thalamic spikes, to a circuit in which spikes generated within the simulation do not trigger synaptic transmission. These simulations are located in the folders `disconnected` for the original circuit, and `rewired/disconnected` for the SM circuit.
Run these simulations as described above. The EEG contribution for a specific presynaptic population is the difference between the EEG from the fully-connected circuit and the EEG from these simulations. This difference is calculated in the jupyter notebook described below.

#### Effect of compressing spike times from PeriTC cells
We investigate the effects of compressing the spike times of periTC cells on the EEG signal. We do so by generating two spike input files, one in which all of the spikes from the fully-connected circuit are present except for those from PeriTC cells, and another in which only the spikes from periTC cells are present and where they all occur simultaneously. To generate the first file, run  `EditSpikeFile_Peri.sh`. To generate the second, run `EditSpikeTiming.sh`
Then, run the simulation campaign in `rewired/disconnected/compressedTime`.

### Generating Figures

To reproduce the figures in the paper, simply run the juptyer notebooks in the root directory of this repo.

# Acknowledgment
The development of this software was supported by funding to the Blue Brain Project, a research center of the École polytechnique fédérale de Lausanne (EPFL), from the Swiss government's ETH Board of the Swiss Federal Institutes of Technology.
