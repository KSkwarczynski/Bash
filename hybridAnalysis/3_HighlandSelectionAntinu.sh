#!/bin/bash
#PBS -m bea
DIRECTORY=/mnt/home/share/t2k/kskwarczynski/hybrid_analysis/hybridRun7/
export CVSROOT=:ext:anoncvs@repo.nd280.org:/home/trt2kmgr/ND280Repository
export CVS_RSH=ssh
unset CVS_SERVER
export CMTPATH=/mnt/home/kskwarczynski/T2K/work/v11r31/
cd /mnt/home/kskwarczynski/T2K/work/v11r31/highland2/antiNumuCCMultiPiAnalysis/v2r6/cmt/
source setup.sh
cd $DIRECTORY/AfterSelections/
#MC
#/mnt/home/kskwarczynski/T2K/work/v11r31/highland2/antiNumuCCMultiPiAnalysis/v2r6/Linux-x86_64/RunAntiNumuCCMultiPiAnalysis.exe $DIRECTORY/scripts/filelist/Run7MCprod6Tlist_$PBS_ARRAYID -v -o Run7MCprod6T-FGD1-antinu_$PBS_ARRAYID.root

# SET FGD2 in /mnt/home/kskwarczynski/T2K/work/v11r31/highland2/antiNumuCCMultiPiAnalysis/v2r6/parameters/
/mnt/home/kskwarczynski/T2K/work/v11r31/highland2/antiNumuCCMultiPiAnalysis/v2r6/Linux-x86_64/RunAntiNumuCCMultiPiAnalysis.exe $DIRECTORY/scripts/filelist/Run7MCprod6Tlist_$PBS_ARRAYID -v -o Run7MCprod6T-FGD2-antinu_$PBS_ARRAYID.root

#DATA
#/mnt/home/kskwarczynski/T2K/work/v11r31/highland2/antiNumuCCMultiPiAnalysis/v2r6/Linux-x86_64/RunAntiNumuCCMultiPiAnalysis.exe $DIRECTORY/scripts/filelist/Run7DATAprod6Tlist_$PBS_ARRAYID -v -o Run7DATAprod6T-FGD1-antinu_$PBS_ARRAYID.root

# SET FGD2 in /mnt/home/kskwarczynski/T2K/work/v11r31/highland2/antiNumuCCMultiPiAnalysis/v2r6/parameters/
#/mnt/home/kskwarczynski/T2K/work/v11r31/highland2/antiNumuCCMultiPiAnalysis/v2r6/Linux-x86_64/RunAntiNumuCCMultiPiAnalysis.exe $DIRECTORY/scripts/filelist/Run7DATAprod6Tlist_$PBS_ARRAYID -v -o Run7DATAprod6T-FGD2-antinu_$PBS_ARRAYID.root
