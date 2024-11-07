#!/bin/bash -l
#SBATCH --job-name="EEG_2_CoordsV"
#SBATCH --partition=prod
#SBATCH --nodes=6
#SBATCH -C clx
#SBATCH --cpus-per-task=2
#SBATCH --time=24:00:00
##SBATCH --mail-type=ALL
#SBATCH --account=proj85
#SBATCH --no-requeue
#SBATCH --output=EEG_2_CoordsV.out
#SBATCH --error=EEG_2_CoordsV.err
#SBATCH --exclusive
#SBATCH --mem=0

spack env activate bluerecording-dev
source ~/bluerecording-dev/bin/activate

mkdir L5PeriTC_rewired


srun -n 10 python editSpikeFile_timing.py 'rewired/97d6aa07-db02-48c6-91c2-b3023ce5bdd0' 'L5PeriTC_rewired/L5PeriTC_rewired' 'True' &
