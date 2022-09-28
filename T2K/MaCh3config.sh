cp /the/config/you/need.cfg config_${PBS_ARRAYID}.cfg
sed -i "/OUTPUTNAME/c\OUTPUTNAME = \"some_output_name.${PBS_ARRAYID}.root\"" config_${PBS_ARRAYID}.cfg
exec/you/want/to/run config_${PBS_ARRAYID}.cfg
