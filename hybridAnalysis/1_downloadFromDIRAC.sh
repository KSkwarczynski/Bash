#!/bin/bash
#PBS -m bea
DIRECTORY=/mnt/home/share/t2k/kskwarczynski/hybrid_analysis/hybridRun7/

/mnt/home/kskwarczynski/T2K_OA/Software/dirac_ui/diracos/bin/dirac-dms-find-lfns Path=/t2k.org/nd280/production007/E/rdp/ND280/00009000_00009999/anal> Run4DataAnal.txt
/mnt/home/kskwarczynski/T2K_OA/Software/dirac_ui/diracos/bin/dirac-dms-get-file Run4DataAnal.txt

/mnt/home/kskwarczynski/T2K_OA/Software/dirac_ui/diracos/bin/dirac-dms-find-lfns Path=/t2k.org/nd280/production007/E/rdp/ND280/00009000_00009999/reco> Run4DataReco.txt
/mnt/home/kskwarczynski/T2K_OA/Software/dirac_ui/diracos/bin/dirac-dms-get-file Run4DataReco.txt

/mnt/home/kskwarczynski/T2K_OA/Software/dirac_ui/diracos/bin/dirac-dms-find-lfns Path=/t2k.org/nd280/production007/E/mcp/neut_5.6.4.1_p7c1/2010-11-air/magnet/run4/reco> Run4McReco.txt
/mnt/home/kskwarczynski/T2K_OA/Software/dirac_ui/diracos/bin/dirac-dms-get-file Run4McReco.txt

/mnt/home/kskwarczynski/T2K_OA/Software/dirac_ui/diracos/bin/dirac-dms-find-lfns Path=/t2k.org/nd280/production007/E/mcp/neut_5.6.4.1_p7c1/2010-11-air/magnet/run4/anal> Run4McAnal.txt
/mnt/home/kskwarczynski/T2K_OA/Software/dirac_ui/diracos/bin/dirac-dms-get-file Run4McAnal.txt




