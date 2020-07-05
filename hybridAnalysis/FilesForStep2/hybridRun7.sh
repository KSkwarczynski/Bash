#!/bin/bash
#PBS -m bea
VERTEXFILE=/mnt/home/share/t2k/kskwarczynski/hybrid_analysis/hybridRun7/FinalRecoFiles/!!!!!!!!!!!!!!!!!
SAMPLE=!!!!!!!!!!!
export CVSROOT=:ext:anoncvs@repo.nd280.org:/home/trt2kmgr/ND280Repository
export CVS_RSH=ssh
unset CVS_SERVER
export CMTPATH=/mnt/home/kskwarczynski/T2K/work/v11r31
source /mnt/home/kskwarczynski/T2K/work/v11r31/nd280Control/v1r67/cmt/setup.sh
source /mnt/home/kskwarczynski/T2K/work/v11r31/highland2/hybrid/v0r0/cmt/setup.sh
source /mnt/home/kskwarczynski/T2K/work/v11r31/fgdRecon/v5r29p1/cmt/setup.sh
#python 1_luna-generate_particles.py
#
# used version with removal of tpc or tpc-fgd events
#python 2_luna-skimHitInfo.py
#
#
# python 3_luna-createHitFiles.py
# removed ifcheck for 100 
#python 3-ww-createHitFiles.py
#
#Job macierzowy do 100, powinno byæ szybciej ni¿ skryptem pythonowym
# python 4_luna-insert_hits.py

#/mnt/home/kskwarczynski/T2K/work/v11r31/highland2/hybrid/v0r0/Linux-x86_64/insertHits_vFinal.exe $VERTEXFILE -O HitFile="./nd280_jobs/job$PBS_ARRAYID-hits.txt" -O TruthFile="./nd280_jobs/job$PBS_ARRAYID-truth.txt" -o nd280_hybrid_cali/ccqe_$SAMPLE-filt-cali_hybrid$PBS_ARRAYID.root
#
# python crashed, don't know why
# python 5_luna-process_hybrid.py

#/mnt/home/kskwarczynski/T2K/work/v11r31/fgdRecon/v5r29p1/Linux-x86_64/RunFgdRecon.exe nd280_hybrid_cali/ccqe_$SAMPLE-filt-cali_hybrid$PBS_ARRAYID.root -o nd280_hybrid_reco/ccqe_$SAMPLE-filt-reco_hybrid$PBS_ARRAYID.root
#
# python 6_luna-analyze_hybrid.py

#/mnt/home/kskwarczynski/T2K/work/v11r31/highland2/hybrid/v0r0/Linux-x86_64/analyzeHybrid_v2.exe nd280_hybrid_reco/ccqe_$SAMPLE-filt-reco_hybrid$PBS_ARRAYID.root -O VertexFile="./data/vertexSkim.txt" -O HMNTFile="./data/selmu_dir.txt" -o nd280_hybrid_histo/ccqe_$SAMPLE-filt_histo_hybrid$PBS_ARRAYID.root
