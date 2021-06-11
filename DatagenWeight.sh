#!/bin/bash
#PBS -m bea
module load gcc/4.9.4
module load git/2.20.1
module load python/2.7.5-x86_64-gcc46
source /mnt/home/kskwarczynski/OA_T2K/v12.31/ROOT_5.34.34.00/Linux-ScientificCERNSLC_6.9-gcc_4.9-x86_64/bin/thisroot.sh
cd /mnt/home/kskwarczynski/OA_T2K/psyche_highland/master_PAC/nd280SoftwarePilot
./configure.sh -i
. nd280SoftwarePilot.profile

#Highland
source /mnt/home/kskwarczynski/OA_T2K/psyche_highland/master_PAC/psycheMaster_3.62/Linux-ScientificCERNSLC_6.10-gcc_4.9-x86_64/setup.sh
source /mnt/home/kskwarczynski/OA_T2K/psyche_highland/master_PAC/highland2Master_2.60/Linux-ScientificCERNSLC_6.10-gcc_4.9-x86_64/setup.sh
source /mnt/home/kskwarczynski/OA_T2K/psyche_highland/master_PAC/oaAnalysisReader_2.22/Linux-ScientificCERNSLC_6.10-gcc_4.9-x86_64/setup.sh
export ND280PROD=prod6T
#NEUT
source /mnt/home/kskwarczynski/OA_T2K/NEUT/OA2021/build/Linux/setup.sh
#NIWGRW
source /mnt/home/kskwarczynski/OA_T2K/NIWGReWeight/OA2021/build/Linux/setup.sh
#T2K RW
source /mnt/home/kskwarczynski/OA_T2K/T2KReWeight/PAC/build/Linux/setup.sh
#OAWeighGenApps
source /mnt/home/kskwarczynski/OA_T2K/OAGenWeightsApps/PAC/build/Linux/setup.sh


cd /mnt/home/kskwarczynski/OA_T2K/OAGenWeightsApps/PAC/build/app/ND280

InputPath=/mnt/home/share/t2k/kskwarczynski/BANFF/flat-trees/2021/Data/
OutpuPath=/mnt/home/share/t2k/kskwarczynski/T2Krw/PAC/data/
ConfigPath=/mnt/home/kskwarczynski/OA_T2K/OAGenWeightsApps/OA2021/app/Configs/

HighlandName=flat_mc6T_nd280Highland2_v2r45_1_data_
declare -a ND280runs=("run2_air" "run2_water" "run3b_air" "run3c_air" "run4_air" "run4_water" "run5c_rhc" "run6b_air_rhc" "run6c_air_rhc" "run6d_air_rhc" "run6e_air_fhc" "run7b" "run8_air_fhc" "run8_water_fhc" "run9b_water_rhc" "run9c_water_rhc" "run9d_water_rhc")

declare -a Spline=("run2aDataSplines_" "run2wDataSplines_" "run3DataSplines_3b_" "run3DataSplines_3c_" "run4aDataSplines_" "run4wDataSplines_" "run5DataSplines_5c_" "run6DataSplines_6b_" "run6DataSplines_6c_" "run6DataSplines_6d_" "run6DataSplines_6e_" "run7DataSplines_7b_" "run8aDataSplines_" "run8wDataSplines_" "run9DataSplines_9b_" "run9DataSplines_9c_" "run9DataSplines_9d_") 17

arraylength=${#ND280runs[@]}
for (( i=0; i<${arraylength}; i++ ));
do
./ND280GenWeights -i $InputPath/${ND280runs[$i]}/$HighlandName${ND280runs[$i]}_00$PBS_ARRAYID.root -o $OutpuPath/${Spline[$i]}$PBS_ARRAYID.root -c $ConfigPath/ND280_OA2021_Config_NoMirroring.toml
./ND280GenWeights -i $InputPath/${ND280runs[$i]}/$HighlandName${ND280runs[$i]}_0$PBS_ARRAYID.root -o $OutpuPath/${Spline[$i]}$PBS_ARRAYID.root -c $ConfigPath/ND280_OA2021_Config_NoMirroring.toml

done
                        
