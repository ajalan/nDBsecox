#!/bin/bash

#$ -o RMG.out.log
#$ -e RMG.err.log
#$ -N nDB_secoxi_1

#$ -cwd
#$ -l normal
#$ -l h_rt=120:00:00

# delete old logs
rm -f RMG.out.log RMG.err.log

export RMG=$HOME/RMG-Java
#export PATH=/home/jdk1.6.0/bin:$PATH:
export LD_LIBRARY_PATH=/home/local/lib:$LD_LIBRARY_PATH

pwd
date
java -version 2>&1

java -Xmx3500m -jar $RMG/bin/RMG.jar condition.txt > RMG.log 2>&1 
# Other java flags:
# -XX:-UseGCOverheadLimit
# Usually, if more than 98% of the total time is spent in garbage collection and less than 2% of the heap is recovered, an OutOfMemoryError will be thrown. This flag disables that feature
# -Xss128k
# Reduces the default maximum thread stack size, which allows more of the process' virtual memory address space to be used by the Java heap.
# -Xmn1200m  does something
# more details at http://java.sun.com/performance/reference/whitepapers/tuning.html

# PYTHON
#export PYTHONPATH=$HOME'/lib/python/'
#~/scripts/notify.py RMG.log RMG_octane
