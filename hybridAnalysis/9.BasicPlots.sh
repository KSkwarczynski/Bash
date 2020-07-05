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

cd $RUNPATH/scripts/

root -l -q -b 'BasicPlots.cpp("vertexSkimRun7DATAprod6T-FGD1-antinu.txt" ,"/mnt/home/share/t2k/kskwarczynski/hybrid_analysis/hybridRun7/scripts", "Run7DATAprod6T-FGD1-antinu")'
root -l -q -b 'BasicPlots.cpp("vertexSkimRun7DATAprod6T-FGD2-antinu.txt" ,"/mnt/home/share/t2k/kskwarczynski/hybrid_analysis/hybridRun7/scripts", "Run7DATAprod6T-FGD2-antinu")'

root -l -q -b 'BasicPlots.cpp("vertexSkimRun7MCprod6T-FGD1-antinu.txt" ,"/mnt/home/share/t2k/kskwarczynski/hybrid_analysis/hybridRun7/scripts", "Run7MCprod6T-FGD1-antinu")'
root -l -q -b 'BasicPlots.cpp("vertexSkimRun7MCprod6T-FGD2-antinu.txt" ,"/mnt/home/share/t2k/kskwarczynski/hybrid_analysis/hybridRun7/scripts", "Run7MCprod6T-FGD2-antinu")'


root -l -q -b 'BasicPlotsComb.cpp("vertexSkimRun7DATAprod6T-FGD1-antinu.txt","vertexSkimRun7MCprod6T-FGD1-antinu.txt","/mnt/home/share/t2k/kskwarczynski/hybrid_analysis/hybridRun7/scripts", "Run7DATAandMCprod6T-FGD1-antinu")'
root -l -q -b 'BasicPlotsComb.cpp("vertexSkimRun7DATAprod6T-FGD2-antinu.txt","vertexSkimRun7MCprod6T-FGD2-antinu.txt","/mnt/home/share/t2k/kskwarczynski/hybrid_analysis/hybridRun7/scripts", "Run7DATAandMCprod6T-FGD2-antinu")'


root -l -q -b 'SelmuPlot.cpp("Run7DATAprod6T-FGD1-antinu.root","Run7MCprod6T-FGD1-antinu.root", "/mnt/home/share/t2k/kskwarczynski/hybrid_analysis/hybridRun7/",  "Run7DataMCprod6T-FGD1-antinu-selmuCosTheta", 2300)'
root -l -q -b 'SelmuPlot.cpp("Run7DATAprod6T-FGD2-antinu.root","Run7MCprod6T-FGD2-antinu.root","/mnt/home/share/t2k/kskwarczynski/hybrid_analysis/hybridRun7/", "Run7DataMCprod6T-FGD2-antinu-selmuCosTheta" , 2300)'
