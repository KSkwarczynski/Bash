Script which help to prepare envirorment for Hybrid Analysis, should be executed in numerated order.
Importart note is to make sure that path in scripts are properly set.

## Macros description
*0_MakeAnalysisStructure.sh* - Creates folder to which further scripts will put ouputs. </br>
*1_downloadFromDIRAC.sh* - as name suggest download files from GRID, better to separately run each line, because it takes some time. It donloads both anal and reco files for Data as well as MC. </br>
*2_MakeList.sh* - creates list of files downloaded in previous step. </br>
*3_HighlandSelectionAntinu.sh* - proccess anal antineutrino sample, you have to run it twice with different FGD setting. </br>
*3_HighlandSelectionNu.sh* - proccess anal neutrino sample, you have to run it twice with different FGD setting. </br>
*4.ExtractFromROOT.sh* - after you are done with Highland you can extract vertex position and other neccesary information from them, this scripts uses `RunExtractor.cpp` </br>
*5.SkimPreparation.sh* - Because you have a lot of reco file but esspecailay for data you will get like up to 4 events per one file this scripts just creates a list of files you are interested in. Scripts uses `ListCreator.cpp`. </br>
*6.SkimFromCSVxxxxx.sh* - all scripts extract simply extract desired vertex events from reco file. Reco files takes a lot of space so it is for convinience. For convinience it is good idea to split file in `$RUNPATH/scripts/filelistReco/SkimmedRun7DATAprod6T-FGD1-antinu_00`, and then create a few copies of given script changing number of input file, **line 14** `input="$RUNPATH/scripts/filelistReco/SkimmedRun7DATAprod6T-FGD1-antinu_00`. </br>
