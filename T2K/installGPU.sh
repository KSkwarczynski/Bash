#locate cuda
module load gcc/4.9.4
module load git/2.20.1
module load python/2.7.5-x86_64-gcc46
source /mnt/home/kskwarczynski/OA_T2K/v12.31/ROOT_5.34.34.00/Linux-ScientificCERNSLC_6.9-gcc_4.9-x86_64/bin/thisroot.sh
cd /mnt/home/kskwarczynski/OA_T2K/MaCh3/MaCh3_linear_develop/
export CUDAPATH=/usr/local/cuda-10.1
nvidia-smi
export MACH3=$(pwd)
cd ${MACH3}/psychestuff/nd280SoftwarePilot
./configure.sh -i
. nd280SoftwarePilot.profile
cd ${MACH3}/psychestuff/highland2SoftwarePilot
source highland2SoftwarePilot.profile
source ${MACH3}/psychestuff/psycheMaster_3.66/Linux-ScientificCERNSLC_6.10-gcc_4.9-x86_64/setup.sh
cd ${MACH3} 
source setup.sh

unset MULTITHREAD
export MULTITHREAD=1

make config
make
