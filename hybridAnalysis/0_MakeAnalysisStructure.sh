#!/bin/bash
#PBS -m bea
DIRECTORY=/mnt/home/share/t2k/kskwarczynski/hybrid_analysis/hybridRun7/
#chose your directory for analysis and then "mkdir scripts" put all scripts there
cd $DIRECTORY/scripts
mkdir filelist
mkdir filelistReco
mkdir JobsOutput
cd ../
mkdir FinalRecoFiles
mkdir recoFiltr
cd recoFiltr
mkdir FGD1
cd FGD1
mkdir Data
mkdir MC
cd ../
mkdir FGD2
cd FGD2
mkdir Data
mkdir MC
cd ../../
#ROZBUDUJ TO DODAJC FGD1/FGD2 i nu antinu
mkdir AfterSelections
mkdir recoFiles
cd recoFiles
mkdir Data
mkdir MC
cd ../
mkdir FGD1
cd FGD1
mkdir antineutrino
cd antineutrino
mkdir Data
cd Data
mkdir pion
cd pion
mkdir data
mkdir JobsOutput
cp $DIRECTORY/scripts/FilesForStep2/generate_particles.cfg .
cp $DIRECTORY/scripts/FilesForStep2/0.split1.sh .
cp $DIRECTORY/scripts/FilesForStep2/0.splitReversed.sh .
cp $DIRECTORY/scripts/FilesForStep2/hybridRun7.sh .
cp $DIRECTORY/scripts/FilesForStep2/pion/1_luna-generate_particles.py .
cp $DIRECTORY/scripts/FilesForStep2/pion/2_luna-skimHitInfo.py .
cp $DIRECTORY/scripts/FilesForStep2/pion/3-ww-createHitFiles.py .
cd ../
mkdir pionMinus
cd pionMinus
mkdir data
mkdir JobsOutput
cp $DIRECTORY/scripts/FilesForStep2/generate_particles.cfg .
cp $DIRECTORY/scripts/FilesForStep2/0.split1.sh .
cp $DIRECTORY/scripts/FilesForStep2/0.splitReversed.sh .
cp $DIRECTORY/scripts/FilesForStep2/hybridRun7.sh .
cp $DIRECTORY/scripts/FilesForStep2/pionMinus/1_luna-generate_particles.py .
cp $DIRECTORY/scripts/FilesForStep2/pionMinus/2_luna-skimHitInfo.py .
cp $DIRECTORY/scripts/FilesForStep2/pionMinus/3-ww-createHitFiles.py .
cd ../
mkdir proton
cd proton
mkdir data
mkdir JobsOutput
cp $DIRECTORY/scripts/FilesForStep2/generate_particles.cfg .
cp $DIRECTORY/scripts/FilesForStep2/0.split1.sh .
cp $DIRECTORY/scripts/FilesForStep2/0.splitReversed.sh .
cp $DIRECTORY/scripts/FilesForStep2/hybridRun7.sh .
cp $DIRECTORY/scripts/FilesForStep2/proton/1_luna-generate_particles.py .
cp $DIRECTORY/scripts/FilesForStep2/proton/2_luna-skimHitInfo.py .
cp $DIRECTORY/scripts/FilesForStep2/proton/3-ww-createHitFiles.py .
cd ../../
mkdir MC
cd MC
mkdir pion
cd pion
mkdir data
mkdir JobsOutput
cp $DIRECTORY/scripts/FilesForStep2/generate_particles.cfg .
cp $DIRECTORY/scripts/FilesForStep2/0.split1.sh .
cp $DIRECTORY/scripts/FilesForStep2/0.splitReversed.sh .
cp $DIRECTORY/scripts/FilesForStep2/hybridRun7.sh .
cp $DIRECTORY/scripts/FilesForStep2/pion/1_luna-generate_particles.py .
cp $DIRECTORY/scripts/FilesForStep2/pion/2_luna-skimHitInfo.py .
cp $DIRECTORY/scripts/FilesForStep2/pion/3-ww-createHitFiles.py .
cd ../
mkdir pionMinus
cd pionMinus
mkdir data
mkdir JobsOutput
cp $DIRECTORY/scripts/FilesForStep2/generate_particles.cfg .
cp $DIRECTORY/scripts/FilesForStep2/0.split1.sh .
cp $DIRECTORY/scripts/FilesForStep2/0.splitReversed.sh .
cp $DIRECTORY/scripts/FilesForStep2/hybridRun7.sh .
cp $DIRECTORY/scripts/FilesForStep2/pionMinus/1_luna-generate_particles.py .
cp $DIRECTORY/scripts/FilesForStep2/pionMinus/2_luna-skimHitInfo.py .
cp $DIRECTORY/scripts/FilesForStep2/pionMinus/3-ww-createHitFiles.py .
cd ../
mkdir proton
cd proton
mkdir data
mkdir JobsOutput
cp $DIRECTORY/scripts/FilesForStep2/generate_particles.cfg .
cp $DIRECTORY/scripts/FilesForStep2/0.split1.sh .
cp $DIRECTORY/scripts/FilesForStep2/0.splitReversed.sh .
cp $DIRECTORY/scripts/FilesForStep2/hybridRun7.sh .
cp $DIRECTORY/scripts/FilesForStep2/proton/1_luna-generate_particles.py .
cp $DIRECTORY/scripts/FilesForStep2/proton/2_luna-skimHitInfo.py .
cp $DIRECTORY/scripts/FilesForStep2/proton/3-ww-createHitFiles.py .
cd ../../
mkdir plots
cd plots
mkdir eff
cd $DIRECTORY/
mkdir FGD2
cd FGD2
mkdir antineutrino
cd antineutrino
mkdir Data
cd Data
mkdir pion
cd pion
mkdir data
mkdir JobsOutput
cp $DIRECTORY/scripts/FilesForStep2/generate_particles.cfg .
cp $DIRECTORY/scripts/FilesForStep2/0.split1.sh .
cp $DIRECTORY/scripts/FilesForStep2/0.splitReversed.sh .
cp $DIRECTORY/scripts/FilesForStep2/hybridRun7.sh .
cp $DIRECTORY/scripts/FilesForStep2/pion/1_luna-generate_particles.py .
cp $DIRECTORY/scripts/FilesForStep2/pion/2_luna-skimHitInfo.py .
cp $DIRECTORY/scripts/FilesForStep2/pion/3-ww-createHitFiles.py .
cd ../
mkdir pionMinus
cd pionMinus
mkdir data
mkdir JobsOutput
cp $DIRECTORY/scripts/FilesForStep2/generate_particles.cfg .
cp $DIRECTORY/scripts/FilesForStep2/0.split1.sh .
cp $DIRECTORY/scripts/FilesForStep2/0.splitReversed.sh .
cp $DIRECTORY/scripts/FilesForStep2/hybridRun7.sh .
cp $DIRECTORY/scripts/FilesForStep2/pionMinus/1_luna-generate_particles.py .
cp $DIRECTORY/scripts/FilesForStep2/pionMinus/2_luna-skimHitInfo.py .
cp $DIRECTORY/scripts/FilesForStep2/pionMinus/3-ww-createHitFiles.py .
cd ../
mkdir proton
cd proton
mkdir data
mkdir JobsOutput
cp $DIRECTORY/scripts/FilesForStep2/generate_particles.cfg .
cp $DIRECTORY/scripts/FilesForStep2/0.split1.sh .
cp $DIRECTORY/scripts/FilesForStep2/0.splitReversed.sh .
cp $DIRECTORY/scripts/FilesForStep2/hybridRun7.sh .
cp $DIRECTORY/scripts/FilesForStep2/proton/1_luna-generate_particles.py .
cp $DIRECTORY/scripts/FilesForStep2/proton/2_luna-skimHitInfo.py .
cp $DIRECTORY/scripts/FilesForStep2/proton/3-ww-createHitFiles.py .
cd ../../
mkdir MC
cd MC
mkdir pion
cd pion
mkdir data
mkdir JobsOutput
cp $DIRECTORY/scripts/FilesForStep2/generate_particles.cfg .
cp $DIRECTORY/scripts/FilesForStep2/0.split1.sh .
cp $DIRECTORY/scripts/FilesForStep2/0.splitReversed.sh .
cp $DIRECTORY/scripts/FilesForStep2/hybridRun7.sh .
cp $DIRECTORY/scripts/FilesForStep2/pion/1_luna-generate_particles.py .
cp $DIRECTORY/scripts/FilesForStep2/pion/2_luna-skimHitInfo.py .
cp $DIRECTORY/scripts/FilesForStep2/pion/3-ww-createHitFiles.py .
cd ../
mkdir pionMinus
cd pionMinus
mkdir data
mkdir JobsOutput
cp $DIRECTORY/scripts/FilesForStep2/generate_particles.cfg .
cp $DIRECTORY/scripts/FilesForStep2/0.split1.sh .
cp $DIRECTORY/scripts/FilesForStep2/0.splitReversed.sh .
cp $DIRECTORY/scripts/FilesForStep2/hybridRun7.sh .
cp $DIRECTORY/scripts/FilesForStep2/pionMinus/1_luna-generate_particles.py .
cp $DIRECTORY/scripts/FilesForStep2/pionMinus/2_luna-skimHitInfo.py .
cp $DIRECTORY/scripts/FilesForStep2/pionMinus/3-ww-createHitFiles.py .
cd ../
mkdir proton
cd proton
mkdir data
mkdir JobsOutput
cp $DIRECTORY/scripts/FilesForStep2/generate_particles.cfg .
cp $DIRECTORY/scripts/FilesForStep2/0.split1.sh .
cp $DIRECTORY/scripts/FilesForStep2/0.splitReversed.sh .
cp $DIRECTORY/scripts/FilesForStep2/hybridRun7.sh .
cp $DIRECTORY/scripts/FilesForStep2/proton/1_luna-generate_particles.py .
cp $DIRECTORY/scripts/FilesForStep2/proton/2_luna-skimHitInfo.py .
cp $DIRECTORY/scripts/FilesForStep2/proton/3-ww-createHitFiles.py .
cd ../../
mkdir plots
cd plots
mkdir eff
cd $DIRECTORY/
cd FGD1
mkdir neutrino
cd neutrino
mkdir Data
cd Data
mkdir pion
cd pion
mkdir data
mkdir JobsOutput
cp $DIRECTORY/scripts/FilesForStep2/generate_particles.cfg .
cp $DIRECTORY/scripts/FilesForStep2/0.split1.sh .
cp $DIRECTORY/scripts/FilesForStep2/0.splitReversed.sh .
cp $DIRECTORY/scripts/FilesForStep2/hybridRun7.sh .
cp $DIRECTORY/scripts/FilesForStep2/pion/1_luna-generate_particles.py .
cp $DIRECTORY/scripts/FilesForStep2/pion/2_luna-skimHitInfo.py .
cp $DIRECTORY/scripts/FilesForStep2/pion/3-ww-createHitFiles.py .
cd ../
mkdir pionMinus
cd pionMinus
mkdir data
mkdir JobsOutput
cp $DIRECTORY/scripts/FilesForStep2/generate_particles.cfg .
cp $DIRECTORY/scripts/FilesForStep2/0.split1.sh .
cp $DIRECTORY/scripts/FilesForStep2/0.splitReversed.sh .
cp $DIRECTORY/scripts/FilesForStep2/hybridRun7.sh .
cp $DIRECTORY/scripts/FilesForStep2/pionMinus/1_luna-generate_particles.py .
cp $DIRECTORY/scripts/FilesForStep2/pionMinus/2_luna-skimHitInfo.py .
cp $DIRECTORY/scripts/FilesForStep2/pionMinus/3-ww-createHitFiles.py .
cd ../
mkdir proton
cd proton
mkdir data
mkdir JobsOutput
cp $DIRECTORY/scripts/FilesForStep2/generate_particles.cfg .
cp $DIRECTORY/scripts/FilesForStep2/0.split1.sh .
cp $DIRECTORY/scripts/FilesForStep2/0.splitReversed.sh .
cp $DIRECTORY/scripts/FilesForStep2/hybridRun7.sh .
cp $DIRECTORY/scripts/FilesForStep2/proton/1_luna-generate_particles.py .
cp $DIRECTORY/scripts/FilesForStep2/proton/2_luna-skimHitInfo.py .
cp $DIRECTORY/scripts/FilesForStep2/proton/3-ww-createHitFiles.py .
cd ../../
mkdir MC
cd MC
mkdir pion
cd pion
mkdir data
mkdir JobsOutput
cp $DIRECTORY/scripts/FilesForStep2/generate_particles.cfg .
cp $DIRECTORY/scripts/FilesForStep2/0.split1.sh .
cp $DIRECTORY/scripts/FilesForStep2/0.splitReversed.sh .
cp $DIRECTORY/scripts/FilesForStep2/hybridRun7.sh .
cp $DIRECTORY/scripts/FilesForStep2/pion/1_luna-generate_particles.py .
cp $DIRECTORY/scripts/FilesForStep2/pion/2_luna-skimHitInfo.py .
cp $DIRECTORY/scripts/FilesForStep2/pion/3-ww-createHitFiles.py .
cd ../
mkdir pionMinus
cd pionMinus
mkdir data
mkdir JobsOutput
cp $DIRECTORY/scripts/FilesForStep2/generate_particles.cfg .
cp $DIRECTORY/scripts/FilesForStep2/0.split1.sh .
cp $DIRECTORY/scripts/FilesForStep2/0.splitReversed.sh .
cp $DIRECTORY/scripts/FilesForStep2/hybridRun7.sh .
cp $DIRECTORY/scripts/FilesForStep2/pionMinus/1_luna-generate_particles.py .
cp $DIRECTORY/scripts/FilesForStep2/pionMinus/2_luna-skimHitInfo.py .
cp $DIRECTORY/scripts/FilesForStep2/pionMinus/3-ww-createHitFiles.py .
cd ../
mkdir proton
cd proton
mkdir data
mkdir JobsOutput
cp $DIRECTORY/scripts/FilesForStep2/generate_particles.cfg .
cp $DIRECTORY/scripts/FilesForStep2/0.split1.sh .
cp $DIRECTORY/scripts/FilesForStep2/0.splitReversed.sh .
cp $DIRECTORY/scripts/FilesForStep2/hybridRun7.sh .
cp $DIRECTORY/scripts/FilesForStep2/proton/1_luna-generate_particles.py .
cp $DIRECTORY/scripts/FilesForStep2/proton/2_luna-skimHitInfo.py .
cp $DIRECTORY/scripts/FilesForStep2/proton/3-ww-createHitFiles.py .
cd ../../
mkdir plots
cd plots
mkdir eff
mkdir overlays
mkdir summary
mkdir Efficiencies
cd Efficiencies
mkdir pion
cd pion
mkdir ratios
cd ../
mkdir proton
cd proton
mkdir ratios
cd $DIRECTORY/
cd FGD2
mkdir neutrino
cd neutrino
mkdir Data
cd Data
mkdir pion
cd pion
mkdir data
mkdir JobsOutput
cp $DIRECTORY/scripts/FilesForStep2/generate_particles.cfg .
cp $DIRECTORY/scripts/FilesForStep2/0.split1.sh .
cp $DIRECTORY/scripts/FilesForStep2/0.splitReversed.sh .
cp $DIRECTORY/scripts/FilesForStep2/hybridRun7.sh .
cp $DIRECTORY/scripts/FilesForStep2/pion/1_luna-generate_particles.py .
cp $DIRECTORY/scripts/FilesForStep2/pion/2_luna-skimHitInfo.py .
cp $DIRECTORY/scripts/FilesForStep2/pion/3-ww-createHitFiles.py .
cd ../
mkdir pionMinus
cd pionMinus
mkdir data
mkdir JobsOutput
cp $DIRECTORY/scripts/FilesForStep2/generate_particles.cfg .
cp $DIRECTORY/scripts/FilesForStep2/0.split1.sh .
cp $DIRECTORY/scripts/FilesForStep2/0.splitReversed.sh .
cp $DIRECTORY/scripts/FilesForStep2/hybridRun7.sh .
cp $DIRECTORY/scripts/FilesForStep2/pionMinus/1_luna-generate_particles.py .
cp $DIRECTORY/scripts/FilesForStep2/pionMinus/2_luna-skimHitInfo.py .
cp $DIRECTORY/scripts/FilesForStep2/pionMinus/3-ww-createHitFiles.py .
cd ../
mkdir proton
cd proton
mkdir data
mkdir JobsOutput
cp $DIRECTORY/scripts/FilesForStep2/generate_particles.cfg .
cp $DIRECTORY/scripts/FilesForStep2/0.split1.sh .
cp $DIRECTORY/scripts/FilesForStep2/0.splitReversed.sh .
cp $DIRECTORY/scripts/FilesForStep2/hybridRun7.sh .
cp $DIRECTORY/scripts/FilesForStep2/proton/1_luna-generate_particles.py .
cp $DIRECTORY/scripts/FilesForStep2/proton/2_luna-skimHitInfo.py .
cp $DIRECTORY/scripts/FilesForStep2/proton/3-ww-createHitFiles.py .
cd ../../
mkdir MC
cd MC
mkdir pion
cd pion
mkdir data
mkdir JobsOutput
cp $DIRECTORY/scripts/FilesForStep2/generate_particles.cfg .
cp $DIRECTORY/scripts/FilesForStep2/0.split1.sh .
cp $DIRECTORY/scripts/FilesForStep2/0.splitReversed.sh .
cp $DIRECTORY/scripts/FilesForStep2/hybridRun7.sh .
cp $DIRECTORY/scripts/FilesForStep2/pion/1_luna-generate_particles.py .
cp $DIRECTORY/scripts/FilesForStep2/pion/2_luna-skimHitInfo.py .
cp $DIRECTORY/scripts/FilesForStep2/pion/3-ww-createHitFiles.py .
cd ../
mkdir pionMinus
cd pionMinus
mkdir data
mkdir JobsOutput
cp $DIRECTORY/scripts/FilesForStep2/generate_particles.cfg .
cp $DIRECTORY/scripts/FilesForStep2/0.split1.sh .
cp $DIRECTORY/scripts/FilesForStep2/0.splitReversed.sh .
cp $DIRECTORY/scripts/FilesForStep2/hybridRun7.sh .
cp $DIRECTORY/scripts/FilesForStep2/pionMinus/1_luna-generate_particles.py .
cp $DIRECTORY/scripts/FilesForStep2/pionMinus/2_luna-skimHitInfo.py .
cp $DIRECTORY/scripts/FilesForStep2/pionMinus/3-ww-createHitFiles.py .
cd ../
mkdir proton
cd proton
mkdir data
mkdir JobsOutput
cp $DIRECTORY/scripts/FilesForStep2/generate_particles.cfg .
cp $DIRECTORY/scripts/FilesForStep2/0.split1.sh .
cp $DIRECTORY/scripts/FilesForStep2/0.splitReversed.sh .
cp $DIRECTORY/scripts/FilesForStep2/hybridRun7.sh .
cp $DIRECTORY/scripts/FilesForStep2/proton/1_luna-generate_particles.py .
cp $DIRECTORY/scripts/FilesForStep2/proton/2_luna-skimHitInfo.py .
cp $DIRECTORY/scripts/FilesForStep2/proton/3-ww-createHitFiles.py .
cd ../../
mkdir plots
cd plots
mkdir eff
mkdir overlays
mkdir summary
mkdir Efficiencies
cd Efficiencies
mkdir pion
cd pion
mkdir ratios
cd ../
mkdir proton
cd proton
mkdir ratios
