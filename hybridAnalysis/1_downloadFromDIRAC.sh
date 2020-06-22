#!/bin/bash
#PBS -m bea
DIRECTORY=/mnt/home/share/t2k/kskwarczynski/hybrid_analysis/hybridRun7/

dirac-dms-find-lfns Path=/t2k.org/nd280/production006/T/rdp/ND280/00012000_00012999/anal> Run7DataAnal.txt
dirac-dms-get-file Run7DataAnal.txt

dirac-dms-find-lfns Path=/t2k.org/nd280/production006/T/rdp/ND280/00012000_00012999/reco> Run7DataReco.txt
dirac-dms-get-file Run7DataReco.txt

dirac-dms-find-lfns Path=/t2k.org/nd280/production006/T/mcp/anti-neut_D/2015-08-water/magnet/run7/reco> Run7McReco.txt
dirac-dms-get-file Run7McReco.txt

dirac-dms-find-lfns Path=/t2k.org/nd280/production006/T/mcp/anti-neut_D/2015-08-water/magnet/run7/anal> Run7McAnal.txt
dirac-dms-get-file Run7McAnal.txt
