Script which help to prepare envirorment for Hybrid Analysis, should be executed in numerated order.
Importart note is to make sure that path in scripts are properly set.

## Macros description
*0_MakeAnalysisStructure.sh* - Creates folder to which further scripts will put ouputs. </br>
*1_downloadFromDIRAC.sh* - as name suggest download files from GRID, better to separately run each line, because it takes some time. It donloads both anal and reco files for Data as well as MC. </br>
*2_MakeList.sh* - creates list of files downloaded in previous step. </br>
*3_HighlandSelectionAntinu.sh* - proccess anal antineutrino sample, you have to run it twice with different FGD setting. </br>
*3_HighlandSelectionNu.sh* - proccess anal neutrino sample, you have to run it twice with different FGD setting. </br>
*4.ExtractFromROOT.sh* - after you are done with Highland you can extract vertex position and other neccesary information from them, this scripts uses 'RunExtractor.cpp' </br>
*5.SkimPreparation.sh*
