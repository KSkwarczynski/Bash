-L/mnt/home/kskwarczynski/T2K_OA/Valgrind/gperftools/.libs -lprofiler

export LD_LIBRARY_PATH=/mnt/home/kskwarczynski/T2K_OA/Valgrind/gperftools/.libs:$LD_LIBRARY_PATH
CPUPROFILE=/mnt/home/kskwarczynski/T2K_OA/MaCh3/MaCh3_SplineThrust/output/Profiler/ND.prof bin/ND280_MCMC kamilConfig/ND_MCMC.cfg

/mnt/home/kskwarczynski/T2K_OA/Valgrind/gperftools/src/pprof --ps --focus="runMCMC" /mnt/home/kskwarczynski/T2K_OA/MaCh3/MaCh3_SplineThrust/bin/ND280_MCMC /mnt/home/kskwarczynski/T2K_OA/MaCh3/MaCh3_SplineThrust/ND.prof.slurmid-0 > profile.ps

