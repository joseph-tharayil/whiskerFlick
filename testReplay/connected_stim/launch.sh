#!/bin/bash -l
#SBATCH --account=proj85
#SBATCH --partition=prod
#SBATCH --nodes=1
#SBATCH --cpus-per-task=2
#SBATCH --constraint=cpu
#SBATCH --exclusive
#SBATCH --time=24:00:00
#SBATCH --job-name=CortexNrdmsPySim

# SPDX-License-Identifier: GPL-3.0-or-later

module load unstable neurodamus-neocortex

srun dplace special -mpi -python $NEURODAMUS_PYTHON/init.py --configFile=simulation_config.json --lb-mode=RoundRobin
