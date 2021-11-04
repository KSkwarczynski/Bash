#!/bin/bash
InputPath=/mnt/home/share/t2k/kskwarczynski/Flat-trees/2021/Data/run1_water_p6T_rdp/
HighlandName=nd280Highland2_v2r67_1_data_run2_air

cd ${InputPath}

i=0
for filename in *.root; do
    echo ${filename}
    mv ${filename} ${HighlandName}_${i}.root
    i=$((i+1))
done
