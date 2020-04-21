#!/bin/bash
#PBS -m bea
export CVSROOT=:ext:anoncvs@repo.nd280.org:/home/trt2kmgr/ND280Repository
export CVS_RSH=ssh
unset CVS_SERVER
export CMTPATH=/mnt/home/kskwarczynski/T2K/work/v11r31
cd /mnt/home/kskwarczynski/T2K/work/v11r31/reconUtils/v1r17p1/cmt/
source setup.sh
SOFTPATH=/mnt/home/kskwarczynski/T2K/work/v11r31/reconUtils/v1r17p1/Linux-x86_64/
RUNPATH=/mnt/home/share/t2k/kskwarczynski/hybrid_analysis/hybridRun7/

cd $RUNPATH/scripts

input="$RUNPATH/scripts/filelistReco/SkimmedRun7MCprod6T-FGD1-antinu_00"
while IFS= read -r line
do
$SOFTPATH/skimFromCSV.exe -O file=$RUNPATH/scripts/ExtractedRun7MCprod6T-FGD1-antinu.csv -o $RUNPATH/recoFiltr/FGD1/MC/$line-filtr.root $RUNPATH/recoFiles/MC/$line
done < "$input"
