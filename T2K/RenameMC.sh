#!/bin/bash
InputPath=/mnt/home/share/t2k/kskwarczynski/Flat-trees/2021/MC/


cd ${InputPath}

cd run2air
HighlandName=nd280Highland2_v2r67_1_run2a

i=0
for filename in *.root; do
    echo ${filename}
    mv ${filename} ${HighlandName}_${i}.root
    i=$((i+1))
done

cd ../run2water
HighlandName=nd280Highland2_v2r67_1_run2w

i=0
for filename in *.root; do
    echo ${filename}
    mv ${filename} ${HighlandName}_${i}.root
    i=$((i+1))
done

cd ../run3air
HighlandName=nd280Highland2_v2r67_1_run3a

i=0
for filename in *.root; do
    echo ${filename}
    mv ${filename} ${HighlandName}_${i}.root
    i=$((i+1))
done

cd ../run4air
HighlandName=nd280Highland2_v2r67_1_run4a

i=0
for filename in *.root; do
    echo ${filename}
    mv ${filename} ${HighlandName}_${i}.root
    i=$((i+1))
done

cd ../run4water
HighlandName=nd280Highland2_v2r67_1_run4w

i=0
for filename in *.root; do
    echo ${filename}
    mv ${filename} ${HighlandName}_${i}.root
    i=$((i+1))
done

cd ../run5water
HighlandName=nd280Highland2_v2r67_1_run5w

i=0
for filename in *.root; do
    echo ${filename}
    mv ${filename} ${HighlandName}_${i}.root
    i=$((i+1))
done

cd ../run6air
HighlandName=nd280Highland2_v2r67_1_run6a

i=0
for filename in *.root; do
    echo ${filename}
    mv ${filename} ${HighlandName}_${i}.root
    i=$((i+1))
done

cd ../run7water
HighlandName=nd280Highland2_v2r67_1_run7w

i=0
for filename in *.root; do
    echo ${filename}
    mv ${filename} ${HighlandName}_${i}.root
    i=$((i+1))
done

cd ../run8air
HighlandName=nd280Highland2_v2r67_1_run8a

i=0
for filename in *.root; do
    echo ${filename}
    mv ${filename} ${HighlandName}_${i}.root
    i=$((i+1))
done

cd ../run8water
HighlandName=nd280Highland2_v2r67_1_run8w

i=0
for filename in *.root; do
    echo ${filename}
    mv ${filename} ${HighlandName}_${i}.root
    i=$((i+1))
done

cd ../run9water
HighlandName=nd280Highland2_v2r67_1_run9w

i=0
for filename in *.root; do
    echo ${filename}
    mv ${filename} ${HighlandName}_${i}.root
    i=$((i+1))
done

