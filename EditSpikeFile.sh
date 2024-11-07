#!/bin/bash -l
#SBATCH --job-name="EEG_2_CoordsV"
#SBATCH --partition=prod
#SBATCH --nodes=2
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


mkdir NoL23Exc_rewired
mkdir NoL4Exc_rewired
mkdir NoL5Exc_rewired
mkdir NoL6Exc_rewired
mkdir NoL1Inh_rewired
mkdir NoL23Inh_rewired
mkdir NoL4Inh_rewired
mkdir NoL5Inh_rewired
mkdir NoL6Inh_rewired

mkdir NoL23Exc
mkdir NoL4Exc
mkdir NoL5Exc
mkdir NoL6Exc
mkdir NoL1Inh
mkdir NoL23Inh
mkdir NoL4Inh
mkdir NoL5Inh
mkdir NoL6Inh

mkdir NoL5LBC
mkdir NoL5NBC
mkdir NoL5LBC_rewired
mkdir NoL5NBC_rewired

srun -n 10 python editSpikeFile.py 'original/fixed/a9f782a3-1f22-4384-a122-430bc6b2323c' 'Layer23Excitatory' 'NoL23Exc/NoL23Exc' 'True' &
srun -n 10 python editSpikeFile.py 'original/fixed/a9f782a3-1f22-4384-a122-430bc6b2323c' 'Layer4Excitatory' 'NoL4Exc/NoL4Exc' 'True' &
srun -n 10 python editSpikeFile.py 'original/fixed/a9f782a3-1f22-4384-a122-430bc6b2323c' 'Layer5Excitatory' 'NoL5Exc/NoL5Exc' 'True' &
srun -n 10 python editSpikeFile.py 'original/fixed/a9f782a3-1f22-4384-a122-430bc6b2323c' 'Layer6Excitatory' 'NoL6Exc/NoL6Exc' 'True' &
srun -n 10 python editSpikeFile.py 'original/fixed/a9f782a3-1f22-4384-a122-430bc6b2323c' 'Layer1Inhibitory' 'NoL1Inh/NoL1Inh' 'True' &
srun -n 10 python editSpikeFile.py 'original/fixed/a9f782a3-1f22-4384-a122-430bc6b2323c' 'Layer23Inhibitory' 'NoL23Inh/NoL23Inh' 'True' &
srun -n 10 python editSpikeFile.py 'original/fixed/a9f782a3-1f22-4384-a122-430bc6b2323c' 'Layer4Inhibitory' 'NoL4Inh/NoL4Inh' 'True' &
srun -n 10 python editSpikeFile.py 'original/fixed/a9f782a3-1f22-4384-a122-430bc6b2323c' 'Layer5Inhibitory' 'NoL5Inh/NoL5Inh' 'True' &
srun -n 10 python editSpikeFile.py 'original/fixed/a9f782a3-1f22-4384-a122-430bc6b2323c' 'Layer6Inhibitory' 'NoL6Inh/NoL6Inh' 'True' &

srun -n 10 python editSpikeFile.py 'rewired/97d6aa07-db02-48c6-91c2-b3023ce5bdd0' 'Layer23Excitatory' 'NoL23Exc_rewired/NoL23Exc_rewired' 'True' &
srun -n 10 python editSpikeFile.py 'rewired/97d6aa07-db02-48c6-91c2-b3023ce5bdd0' 'Layer4Excitatory' 'NoL4Exc_rewired/NoL4Exc_rewired' 'True' &
srun -n 10 python editSpikeFile.py 'rewired/97d6aa07-db02-48c6-91c2-b3023ce5bdd0' 'Layer5Excitatory' 'NoL5Exc_rewired/NoL5Exc_rewired' 'True' &
srun -n 10 python editSpikeFile.py 'rewired/97d6aa07-db02-48c6-91c2-b3023ce5bdd0' 'Layer6Excitatory' 'NoL6Exc_rewired/NoL6Exc_rewired' 'True' &
srun -n 10 python editSpikeFile.py 'rewired/97d6aa07-db02-48c6-91c2-b3023ce5bdd0' 'Layer1Inhibitory' 'NoL1Inh_rewired/NoL1Inh_rewired' 'True' &
srun -n 10 python editSpikeFile.py 'rewired/97d6aa07-db02-48c6-91c2-b3023ce5bdd0' 'Layer23Inhibitory' 'NoL23Inh_rewired/NoL23Inh_rewired' 'True' &
srun -n 10 python editSpikeFile.py 'rewired/97d6aa07-db02-48c6-91c2-b3023ce5bdd0' 'Layer4Inhibitory' 'NoL4Inh_rewired/NoL4Inh_rewired' 'True' &
srun -n 10 python editSpikeFile.py 'rewired/97d6aa07-db02-48c6-91c2-b3023ce5bdd0' 'Layer5Inhibitory' 'NoL5Inh_rewired/NoL5Inh_rewired' 'True' &
srun -n 10 python editSpikeFile.py 'rewired/97d6aa07-db02-48c6-91c2-b3023ce5bdd0' 'Layer6Inhibitory' 'NoL6Inh_rewired/NoL6Inh_rewired' 'True' &

srun -n 10 python editSpikeFile.py 'rewired/97d6aa07-db02-48c6-91c2-b3023ce5bdd0' 'L5_LBC' 'NoL5LBC_rewired/NoL5LBC_rewired' 'True' &
srun -n 10 python editSpikeFile.py 'rewired/97d6aa07-db02-48c6-91c2-b3023ce5bdd0' 'L5_NBC' 'NoL5NBC_rewired/NoL5NBC_rewired' 'True' &

srun -n 10 python editSpikeFile.py 'original/fixed/a9f782a3-1f22-4384-a122-430bc6b2323c' 'L5_LBC' 'NoL5LBC/NoL5LBC' 'True' &
srun -n 10 python editSpikeFile.py 'original/fixed/a9f782a3-1f22-4384-a122-430bc6b2323c' 'L5_NBC' 'NoL5NBC/NoL5NBC' 'True' &

wait