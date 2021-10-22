#!/bin/bash

if [[ $# -ne 1 ]]; then
  echo "Need PID of process"
  exit
fi

PID=$1

memory=$(grep VmRSS /proc/${PID}/status)

secs=$(ps -p ${PID} -o etimes= )

echo "${secs} ${memory}"
