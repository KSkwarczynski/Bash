while true; do
  
  memory=$(grep VmRSS /proc/24983/status)

  #secs=$(ps -p ${PID} -o etimes= )

  #echo "${memory}"
  echo "${memory}" >> some_file_name
  sleep 0.2;
done
