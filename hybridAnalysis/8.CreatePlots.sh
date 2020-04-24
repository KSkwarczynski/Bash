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

#FGD1
cd $RUNPATH/FGD1/antineutrino/Data/pion/nd280_hybrid_histo
hadd $RUNPATH/FGD1/antineutrino/plots/final_pion_data_tree.root `ls -1 *.root`

cd $RUNPATH/FGD1/antineutrino/Data/proton/nd280_hybrid_histo
hadd $RUNPATH/FGD1/antineutrino/plots/final_proton_data_tree.root `ls -1 *.root`

cd $RUNPATH/FGD1/antineutrino/MC/pion/nd280_hybrid_histo
hadd $RUNPATH/FGD1/antineutrino/plots/final_pion_mc_tree.root `ls -1 *.root`

cd $RUNPATH/FGD1/antineutrino/MC/proton/nd280_hybrid_histo
hadd $RUNPATH/FGD1/antineutrino/plots/final_proton_mc_tree.root `ls -1 *.root`

#FGD2
cd $RUNPATH/FGD2/antineutrino/Data/pion/nd280_hybrid_histo
hadd $RUNPATH/FGD2/antineutrino/plots/final_pion_data_tree.root `ls -1 *.root`

cd $RUNPATH/FGD2/antineutrino/Data/proton/nd280_hybrid_histo
hadd $RUNPATH/FGD2/antineutrino/plots/final_proton_data_tree.root `ls -1 *.root`

cd $RUNPATH/FGD2/antineutrino/MC/pion/nd280_hybrid_histo
hadd $RUNPATH/FGD2/antineutrino/plots/final_pion_mc_tree.root `ls -1 *.root`

cd $RUNPATH/FGD2/antineutrino/MC/proton/nd280_hybrid_histo
hadd $RUNPATH/FGD2/antineutrino/plots/final_proton_mc_tree.root `ls -1 *.root`

#WARNING
#You have to move plots folder and run procces*.sh, 


