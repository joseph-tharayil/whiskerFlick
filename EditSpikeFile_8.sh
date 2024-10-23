#!/bin/bash -l
#SBATCH --job-name="EEG_2_CoordsV"
#SBATCH --partition=prod
#SBATCH --nodes=60
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

#srun python editSpikeFile.py 'rewired/f090d92c-29b1-4033-96d2-e1a67b33dab6/0' 'L5_BTC' 'NoL5BTC_rewired.h5' 'True' &
#srun python editSpikeFile.py 'rewired/f090d92c-29b1-4033-96d2-e1a67b33dab6/0' 'L5_SBC' 'NoL5SBC_rewired.h5' 'True' &

#mkdir NoL23Exc_rewired
#mkdir NoL4Exc_rewired
#mkdir NoL5Exc_rewired
#mkdir NoL6Exc_rewired
#mkdir NoL1Inh_rewired
#mkdir NoL23Inh_rewired
#mkdir NoL4Inh_rewired
#mkdir NoL5Inh_rewired
#mkdir NoL6Inh_rewired

#mkdir NoL23Exc
#mkdir NoL4Exc
#mkdir NoL5Exc
#mkdir NoL6Exc
#mkdir NoL1Inh
#mkdir NoL23Inh
#mkdir NoL4Inh
#mkdir NoL5Inh
#mkdir NoL6Inh

#mkdir NoL5MC
#mkdir NoL5LBC
#mkdir NoL5NBC

mkdir NoL5MC_rewired
mkdir NoL5LBC_rewired
mkdir NoL5NBC_rewired

#mkdir NoL1Inh
#mkdir NoL1Inh_rewired

#srun -n 10 python editSpikeFile.py 'original/1a8bf077-4f6c-4bcb-b257-ca1f3d2388cd' 'Layer1Inhibitory' 'NoL1Inh/NoL1Inh' 'True' &
#srun -n 10 python editSpikeFile.py 'original/1a8bf077-4f6c-4bcb-b257-ca1f3d2388cd' 'Layer23Excitatory' 'NoL23Exc/NoL23Exc' 'True' &
#srun -n 10 python editSpikeFile.py 'original/1a8bf077-4f6c-4bcb-b257-ca1f3d2388cd' 'Layer4Excitatory' 'NoL4Exc/NoL4Exc' 'True' &
#srun -n 10 python editSpikeFile.py 'original/1a8bf077-4f6c-4bcb-b257-ca1f3d2388cd' 'Layer5Excitatory' 'NoL5Exc/NoL5Exc' 'True' &
#srun -n 10 python editSpikeFile.py 'original/1a8bf077-4f6c-4bcb-b257-ca1f3d2388cd' 'Layer6Excitatory' 'NoL6Exc/NoL6Exc' 'True' &
#srun -n 10 python editSpikeFile.py 'original/1a8bf077-4f6c-4bcb-b257-ca1f3d2388cd' 'Layer1Inhibitory' 'NoL1Inh/NoL1Inh' 'True' &
#srun -n 10 python editSpikeFile.py 'original/1a8bf077-4f6c-4bcb-b257-ca1f3d2388cd' 'Layer23Inhibitory' 'NoL23Inh/NoL23Inh' 'True' &
#srun -n 10 python editSpikeFile.py 'original/1a8bf077-4f6c-4bcb-b257-ca1f3d2388cd' 'Layer4Inhibitory' 'NoL4Inh/NoL4Inh' 'True' &
#srun -n 10 python editSpikeFile.py 'original/1a8bf077-4f6c-4bcb-b257-ca1f3d2388cd' 'Layer5Inhibitory' 'NoL5Inh/NoL5Inh' 'True' &
#srun -n 10 python editSpikeFile.py 'original/1a8bf077-4f6c-4bcb-b257-ca1f3d2388cd' 'Layer6Inhibitory' 'NoL6Inh/NoL6Inh' 'True' &

srun -n 10 python editSpikeFile.py 'rewired/97d6aa07-db02-48c6-91c2-b3023ce5bdd0' 'Layer6Inhibitory' 'NoL6Inh_rewired/NoL6Inh_rewired' 'True' &

#srun -n 10 python editSpikeFile.py 'rewired/928bf14f-de66-4a86-aca0-e9677923684d' 'L5_MC' 'NoL5MC_rewired/NoL5MC_rewired' 'True' &

#srun -n 10 python editSpikeFile.py 'original/1a8bf077-4f6c-4bcb-b257-ca1f3d2388cd' 'L5_MC' 'NoL5MC/NoL5MC' 'True' &
#srun -n 10 python editSpikeFile.py 'original/1a8bf077-4f6c-4bcb-b257-ca1f3d2388cd' 'L5_LBC' 'NoL5LBC/NoL5LBC' 'True' &
#srun -n 10 python editSpikeFile.py 'original/1a8bf077-4f6c-4bcb-b257-ca1f3d2388cd' 'L5_NBC' 'NoL5NBC/NoL5NBC' 'True' &

wait
