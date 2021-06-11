#!/bin/bash
# $SAMPLE="default"
rm ParticleGun-*
declare -a particle=("mu-" "mu+" "anti_proton" "proton" "pi-" "pi+")
arraylength=${#particle[@]}
directory=/mnt/home/kskwarczynski/T2K/work/v11r31/highland2/antiNumuCCMultiPiAnalysis/v2r6/
linux=Linux-x86_64/
program=RunAntiNumuCCMultiPiAnalysis.exe
cmt=cmt
array=\$PBS_ARRAYID
zera=00
for (( i=0; i<${arraylength}; i++ ));
do
if [[ "${particle[$i]}" == "mu-" || "${particle[$i]}" == "pi-" || "${particle[$i]}" == "anti_proton" ]]; then
directory=/mnt/home/kskwarczynski/T2K/work/v11r31/highland2/numuCCAnalysis/v2r16/
program=RunNumuCCAnalysis.exe
fi
if [[ "${particle[$i]}" == "mu+" || "${particle[$i]}" == "pi+" || "${particle[$i]}" == "proton" ]]; then
directory=/mnt/home/kskwarczynski/T2K/work/v11r31/highland2/antiNumuCCAnalysis/v2r4/
program=RunAntiNumuCCAnalysis.exe
fi

filename=ParticleGun-${particle[$i]}-Accum0.sh
echo "#!/bin/bash" >> $filename
echo "#PBS -m bea" >> $filename
echo "export CVSROOT=:ext:anoncvs@repo.nd280.org:/home/trt2kmgr/ND280Repository" >> $filename
echo "export CVS_RSH=ssh" >> $filename
echo "unset CVS_SERVER" >> $filename
echo "export CMTPATH=/mnt/home/kskwarczynski/T2K/work/v11r31" >> $filename
echo "cd $directory$cmt" >> $filename
echo "source setup.sh" >> $filename
echo "cd /mnt/home/kskwarczynski/T2K/work/v11r31/nd280Control/v1r67/HighlandOutput" >> $filename
echo "$directory$linux$program /mnt/home/kskwarczynski/T2K/FilesList/ParticleGun/ParticleGun${particle[$i]}_$array -v -o ParticleGun-${particle[$i]}-$array-$zera-Accum0.root" >> $filename
done
