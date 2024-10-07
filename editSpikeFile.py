import numpy as np
import bluepysnap as bp
import h5py
import sys
from mpi4py import MPI

def editSpikeFile(path_to_sims,target_type,newPath,remove=False):

    iteration = MPI.COMM_WORLD.Get_rank()
    path_to_sim = path_to_sims+'/'+str(iteration)

    s = bp.Simulation(path_to_sim+'/simulation_config.json')
    c = s.circuit

    nodes = c.nodes.ids(target_type).get_ids()

    f = h5py.File(path_to_sim+'/reporting/spikes.h5')

    if remove:
        nodeIndices = np.where(~np.isin(f['spikes']['S1nonbarrel_neurons']['node_ids'],nodes))
    else:
        nodeIndices = np.where(np.isin(f['spikes']['S1nonbarrel_neurons']['node_ids'],nodes))

    newNodes = f['spikes']['S1nonbarrel_neurons']['node_ids'][nodeIndices]
    newTimes = f['spikes']['S1nonbarrel_neurons']['timestamps'][nodeIndices]

    f.close()

    newFile = newPath+'_'+str(iteration)+'.h5'

    f = h5py.File(newFile,'w')
    g = f.create_group("spikes/S1nonbarrel_neurons")
    g.create_dataset("node_ids",data=newNodes)
    g.create_dataset("timestamps",data=newTimes)
    f['spikes']['S1nonbarrel_neurons']['timestamps'].attrs['units'] = 'ms'
    f.close()

if __name__=='__main__':

    path_to_sims = sys.argv[1]
    target_type = sys.argv[2]
    newPath = sys.argv[3]
    if len(sys.argv)>4:
        remove = sys.argv[4]
    else:
        remove = False

    editSpikeFile(path_to_sims,target_type,newPath,remove)
