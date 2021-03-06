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
root -l -q -b 'RunExtractor.cpp("Run7DATAprod6T-FGD1-antinu.root","ExtractedRun7DATAprod6T-FGD1-antinu.csv", 0)'
root -l -q -b 'RunExtractor.cpp("Run7DATAprod6T-FGD2-antinu.root","ExtractedRun7DATAprod6T-FGD2-antinu.csv", 0)'

#PLIKI TXT
#antineutrino DATA
root -l -q -b 'RunExtractor.cpp("Run7DATAprod6T-FGD1-antinu.root","VertexRun7DATAprod6T-FGD1-antinu.txt", 1'
root -l -q -b 'RunExtractor.cpp("Run7DATAprod6T-FGD2-antinu.root","VertexRun7DATAprod6T-FGD2-antinu.txt", 1)'

#PLIKI TXT+VERTEX POSITION
#antineutrino DATA
root -l -q -b 'RunExtractor.cpp("Run7DATAprod6T-FGD1-antinu.root","vertexSkimRun7DATAprod6T-FGD1-antinu.txt", 2)'
root -l -q -b 'RunExtractor.cpp("Run7DATAprod6T-FGD2-antinu.root","vertexSkimRun7DATAprod6T-FGD2-antinu.txt", 2)'

#PLIKI TXT+SELMU DIR
#antineutrino DATA
root -l -q -b 'RunExtractor.cpp("Run7DATAprod6T-FGD1-antinu.root","selmu_dirRun7DATAprod6T-FGD1-antinu.txt", 3)'
root -l -q -b 'RunExtractor.cpp("Run7DATAprod6T-FGD2-antinu.root","selmu_dirRun7DATAprod6T-FGD2-antinu.txt", 3)'



#antineutrino MC
root -l -q -b 'RunExtractor.cpp("Run7MCprod6T-FGD1-antinu.root","ExtractedRun7MCprod6T-FGD1-antinu.csv", 0)'
root -l -q -b 'RunExtractor.cpp("Run7MCprod6T-FGD2-antinu.root","ExtractedRun7MCprod6T-FGD2-antinu.csv", 0)'

#PLIKI TXT
#antineutrino MC
root -l -q -b 'RunExtractor.cpp("Run7MCprod6T-FGD1-antinu.root","VertexRun7MCprod6T-FGD1-antinu.txt", 1)'
root -l -q -b 'RunExtractor.cpp("Run7MCprod6T-FGD2-antinu.root","VertexRun7MCprod6T-FGD2-antinu.txt", 1)'

#PLIKI TXT+VERTEX POSITION
#antineutrino MC
root -l -q -b 'RunExtractor.cpp("Run7MCprod6T-FGD1-antinu.root","vertexSkimRun7MCprod6T-FGD1-antinu.txt", 2)'
root -l -q -b 'RunExtractor.cpp("Run7MCprod6T-FGD2-antinu.root","vertexSkimRun7MCprod6T-FGD2-antinu.txt", 2)'

#PLIKI TXT+SELMU DIR
#antineutrino MC
root -l -q -b 'RunExtractor.cpp("Run7MCprod6T-FGD1-antinu.root","selmu_dirRun7MCprod6T-FGD1-antinu.txt", 3)'
root -l -q -b 'RunExtractor.cpp("Run7MCprod6T-FGD2-antinu.root","selmu_dirRun7MCprod6T-FGD2-antinu.txt", 3)'

#DATA
cp vertexSkimRun7DATAprod6T-FGD1-antinu.txt $DIRECTORY/FGD1/antineutrino/Data/proton/data/vertexSkim.txt
cp vertexSkimRun7DATAprod6T-FGD1-antinu.txt $DIRECTORY/FGD1/antineutrino/Data/pion/data/vertexSkim.txt
cp vertexSkimRun7DATAprod6T-FGD1-antinu.txt $DIRECTORY/FGD1/antineutrino/Data/pionMinus/data/vertexSkim.txt

cp vertexSkimRun7DATAprod6T-FGD2-antinu.txt $DIRECTORY/FGD2/antineutrino/Data/proton/data/vertexSkim.txt
cp vertexSkimRun7DATAprod6T-FGD2-antinu.txt $DIRECTORY/FGD2/antineutrino/Data/pion/data/vertexSkim.txt
cp vertexSkimRun7DATAprod6T-FGD2-antinu.txt $DIRECTORY/FGD2/antineutrino/Data/pionMinus/data/vertexSkim.txt
#MC
cp vertexSkimRun7MCprod6T-FGD1-antinu.txt $DIRECTORY/FGD1/antineutrino/MC/proton/data/vertexSkim.txt
cp vertexSkimRun7MCprod6T-FGD1-antinu.txt $DIRECTORY/FGD1/antineutrino/MC/pion/data/vertexSkim.txt
cp vertexSkimRun7MCprod6T-FGD1-antinu.txt $DIRECTORY/FGD1/antineutrino/MC/pionMinus/data/vertexSkim.txt

cp vertexSkimRun7MCprod6T-FGD2-antinu.txt $DIRECTORY/FGD2/antineutrino/MC/proton/data/vertexSkim.txt
cp vertexSkimRun7MCprod6T-FGD2-antinu.txt $DIRECTORY/FGD2/antineutrino/MC/pion/data/vertexSkim.txt
cp vertexSkimRun7MCprod6T-FGD2-antinu.txt $DIRECTORY/FGD2/antineutrino/MC/pionMinus/data/vertexSkim.txt
#DATA
cp selmu_dirRun7DATAprod6T-FGD1-antinu.txt $DIRECTORY/FGD1/antineutrino/Data/proton/data/selmu_dir.txt
cp selmu_dirRun7DATAprod6T-FGD1-antinu.txt $DIRECTORY/FGD1/antineutrino/Data/pion/data/selmu_dir.txt
cp selmu_dirRun7DATAprod6T-FGD1-antinu.txt $DIRECTORY/FGD1/antineutrino/Data/pionMinus/data/selmu_dir.txt

cp selmu_dirRun7DATAprod6T-FGD2-antinu.txt $DIRECTORY/FGD2/antineutrino/Data/proton/data/selmu_dir.txt
cp selmu_dirRun7DATAprod6T-FGD2-antinu.txt $DIRECTORY/FGD2/antineutrino/Data/pion/data/selmu_dir.txt
cp selmu_dirRun7DATAprod6T-FGD2-antinu.txt $DIRECTORY/FGD2/antineutrino/Data/pionMinus/data/selmu_dir.txt
#MC
cp selmu_dirRun7MCprod6T-FGD1-antinu.txt $DIRECTORY/FGD1/antineutrino/MC/proton/data/selmu_dir.txt
cp selmu_dirRun7MCprod6T-FGD1-antinu.txt $DIRECTORY/FGD1/antineutrino/MC/pion/data/selmu_dir.txt
cp selmu_dirRun7MCprod6T-FGD1-antinu.txt $DIRECTORY/FGD1/antineutrino/MC/pionMinus/data/selmu_dir.txt

cp selmu_dirRun7MCprod6T-FGD2-antinu.txt $DIRECTORY/FGD2/antineutrino/MC/proton/data/selmu_dir.txt
cp selmu_dirRun7MCprod6T-FGD2-antinu.txt $DIRECTORY/FGD2/antineutrino/MC/pion/data/selmu_dir.txt
cp selmu_dirRun7MCprod6T-FGD2-antinu.txt $DIRECTORY/FGD2/antineutrino/MC/pionMinus/data/selmu_dir.txt



