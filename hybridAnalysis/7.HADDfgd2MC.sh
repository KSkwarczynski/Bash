#!/bin/bash
#PBS -m bea
export CVSROOT=:ext:anoncvs@repo.nd280.org:/home/trt2kmgr/ND280Repository
export CVS_RSH=ssh
unset CVS_SERVER
export CMTPATH=/mnt/home/kskwarczynski/T2K/work/v11r31
cd /mnt/home/kskwarczynski/T2K/work/v11r31/reconUtils/v1r17p1/cmt/
source setup.sh
cd /mnt/home/kskwarczynski/T2K/work/v11r31/nd280/v11r31/cmt
source setup.sh
cd /mnt/home/kskwarczynski/T2K/work/v11r31/highland2/antiNumuCCMultiPiAnalysis/v2r6/cmt
source setup.sh

RUNPATH=/mnt/home/share/t2k/kskwarczynski/hybrid_analysis/hybridRun7/

cd $RUNPATH/recoFiltr/FGD2/MC
hadd $RUNPATH/FinalRecoFiles/Run7prod6-FGD2-MC-Filtr.root `ls -1 *.root`
