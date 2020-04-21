#!/bin/bash
#PBS -m bea
DIRECTORY=/mnt/home/share/t2k/kskwarczynski/hybrid_analysis/hybridRun7/
export CVSROOT=:ext:anoncvs@repo.nd280.org:/home/trt2kmgr/ND280Repository
export CVS_RSH=ssh
unset CVS_SERVER
export CMTPATH=/mnt/home/kskwarczynski/T2K/work/v11r31/
cd /mnt/home/kskwarczynski/T2K/work/v11r31/highland2/antiNumuCCMultiPiAnalysis/v2r6/cmt/
source setup.sh
cd $DIRECTORY/scripts/filelist/
#List for data
ls -d /mnt/home/share/t2k/kskwarczynski/OaAnalysis/run7/data/*.root >Run7DATAprod6Tlist.txt
split -d -l 100 Run7DATAprod6Tlist.txt Run7DATAprod6Tlist_
#list for MC
ls -d /mnt/home/share/t2k/kskwarczynski/OaAnalysis/run7/MC/*.root >Run7MCprod6Tlist.txt
split -d -l 100 Run7MCprod6Tlist.txt Run7MCprod6Tlist_

cd $DIRECTORY/script/filelistReco/
ls -d /mnt/home/share/t2k/kskwarczynski/hybrid_analysis/hybridRun7/recoFiles/Data/*.root >Run7DATAprod6Trecolist.txt
split -d -l 100 Run7DATAprod6Trecolist.txt Run7DATAprod6Trecolist_
#list for MC
ls -d /mnt/home/share/t2k/kskwarczynski/hybrid_analysis/hybridRun7/recoFiles/MC/*.root >Run7MCprod6Trecolist.txt
split -d -l 100 Run7MCprod6Trecolist.txt Run7MCprod6Trecolist_
