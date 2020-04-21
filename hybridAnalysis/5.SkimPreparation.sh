#!/bin/bash
#PBS -m bea
DIRECTORY=/mnt/home/share/t2k/kskwarczynski/hybrid_analysis/hybridRun7/
export CVSROOT=:ext:anoncvs@repo.nd280.org:/home/trt2kmgr/ND280Repository
export CVS_RSH=ssh
unset CVS_SERVER
export CMTPATH=/mnt/home/kskwarczynski/T2K/work/v11r31/
cd /mnt/home/kskwarczynski/T2K/work/v11r31/highland2/antiNumuCCMultiPiAnalysis/v2r6/cmt
source setup.sh
cd $DIRECTORY/scripts/
#PLIKI CSV 
#antineutrino DATA
root -l -q -b 'ListCreator.cpp("VertexRun7DATAprod6T-FGD1-antinu.txt","Run7DATAprod6Trecolist.txt", "SkimmedRun7DATAprod6T-FGD1-antinu.txt", 0)'
root -l -q -b 'ListCreator.cpp("VertexRun7DATAprod6T-FGD2-antinu.txt","Run7DATAprod6Trecolist.txt", "SkimmedRun7DATAprod6T-FGD2-antinu.txt", 0)'

#antineutrino MC
root -l -q -b 'ListCreator.cpp("VertexRun7MCprod6T-FGD1-antinu.txt","Run7MCprod6Trecolist.txt", "SkimmedRun7MCprod6T-FGD1-antinu.txt", 1)'
root -l -q -b 'ListCreator.cpp("VertexRun7MCprod6T-FGD2-antinu.txt","Run7MCprod6Trecolist.txt", "SkimmedRun7MCprod6T-FGD2-antinu.txt", 1)'

