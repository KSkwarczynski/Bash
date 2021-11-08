#!/bin/bash
InputPath=/mnt/home/share/t2k/kskwarczynski/Flat-trees/2021/Sand/


cd ${InputPath}

cd run3water_FHC
HighlandName=nd280Highland2_v2r67_1_sand_run3w_air

i=0
for filename in *.root; do
    echo ${filename}
    mv ${filename} ${HighlandName}_${i}.root
    i=$((i+1))
done

cd ../run3water_RHC
HighlandName=nd280Highland2_v2r67_1_sand_run3w_air

i=0
for filename in *.root; do
    echo ${filename}
    mv ${filename} ${HighlandName}_${i}.root
    i=$((i+1))
done
