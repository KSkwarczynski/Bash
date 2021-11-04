#!/bin/bash
InputPath=/mnt/home/share/t2k/kskwarczynski/Flat-trees/2021/Data/


cd ${InputPath}

cd run2_air
HighlandName=nd280Highland2_v2r67_1_data_run2_air

i=0
for filename in *.root; do
    echo ${filename}
    mv ${filename} ${HighlandName}_${i}.root
    i=$((i+1))
done

cd ../run2_water
HighlandName=nd280Highland2_v2r67_1_data_run2_water

i=0
for filename in *.root; do
    echo ${filename}
    mv ${filename} ${HighlandName}_${i}.root
    i=$((i+1))
done

cd ../run3b_air
HighlandName=nd280Highland2_v2r67_1_data_run3b_air

i=0
for filename in *.root; do
    echo ${filename}
    mv ${filename} ${HighlandName}_${i}.root
    i=$((i+1))
done

cd ../run3c_air
HighlandName=nd280Highland2_v2r67_1_data_run3c_air

i=0
for filename in *.root; do
    echo ${filename}
    mv ${filename} ${HighlandName}_${i}.root
    i=$((i+1))
done

cd ../run4_air
HighlandName=nd280Highland2_v2r67_1_data_run4_air

i=0
for filename in *.root; do
    echo ${filename}
    mv ${filename} ${HighlandName}_${i}.root
    i=$((i+1))
done


cd ../run5c_rhc
HighlandName=nd280Highland2_v2r67_1_data_run5c_rhc

i=0
for filename in *.root; do
    echo ${filename}
    mv ${filename} ${HighlandName}_${i}.root
    i=$((i+1))
done


cd ../run6b_air_rhc
HighlandName=nd280Highland2_v2r67_1_data_run6b_air_rhc

i=0
for filename in *.root; do
    echo ${filename}
    mv ${filename} ${HighlandName}_${i}.root
    i=$((i+1))
done


cd ../run6c_air_rhc
HighlandName=nd280Highland2_v2r67_1_data_run6c_air_rhc

i=0
for filename in *.root; do
    echo ${filename}
    mv ${filename} ${HighlandName}_${i}.root
    i=$((i+1))
done



cd ../run6d_air_rhc
HighlandName=nd280Highland2_v2r67_1_data_run6d_air_rhc

i=0
for filename in *.root; do
    echo ${filename}
    mv ${filename} ${HighlandName}_${i}.root
    i=$((i+1))
done



cd ../run6e_air_rhc
HighlandName=nd280Highland2_v2r67_1_data_run6e_air_rhc

i=0
for filename in *.root; do
    echo ${filename}
    mv ${filename} ${HighlandName}_${i}.root
    i=$((i+1))
done


cd ../run7b
HighlandName=nd280Highland2_v2r67_1_data_run7b

i=0
for filename in *.root; do
    echo ${filename}
    mv ${filename} ${HighlandName}_${i}.root
    i=$((i+1))
done



cd ../run8_air_fhc
HighlandName=nd280Highland2_v2r67_1_data_run8_air_fhc

i=0
for filename in *.root; do
    echo ${filename}
    mv ${filename} ${HighlandName}_${i}.root
    i=$((i+1))
done


cd ../run8_water_fhc
HighlandName=nd280Highland2_v2r67_1_data_run8_water_fhc

i=0
for filename in *.root; do
    echo ${filename}
    mv ${filename} ${HighlandName}_${i}.root
    i=$((i+1))
done

cd ../run9b_water_rhc
HighlandName=nd280Highland2_v2r67_1_data_run9b_water_rhc

i=0
for filename in *.root; do
    echo ${filename}
    mv ${filename} ${HighlandName}_${i}.root
    i=$((i+1))
done


cd ../run9c_water_rhc
HighlandName=nd280Highland2_v2r67_1_data_run9c_water_rhc

i=0
for filename in *.root; do
    echo ${filename}
    mv ${filename} ${HighlandName}_${i}.root
    i=$((i+1))
done
