#!/bin/env bash 
{

export USER="$(id -u -n)"
export LOGNAME=${USER}
export HOME=/sphenix/u/${USER}

source /opt/sphenix/core/bin/sphenix_setup.sh -n $8
./cups.py -r ${runnumber} -s 0 --dstname=DST_EVENT_auau23_${build}_${dbtag} started

hostname

this_script=$BASH_SOURCE
this_script=`readlink -f $this_script`
this_dir=`dirname $this_script`
echo rsyncing from $this_dir
echo running: $this_script $*

if [[ ! -z "$_CONDOR_SCRATCH_DIR" && -d $_CONDOR_SCRATCH_DIR ]]
then
    cd $_CONDOR_SCRATCH_DIR
else
    echo condor scratch NOT set
    exit 1
fi

nevents=$1
basefilename=$2
baselogname=$3
outputdir=$4
runnumber=$5
clusterid=$6
procid=$7
build=${8/./}
dbtag=$9

seb00="./seb00_${runnumber}.list"
seb01="./seb01_${runnumber}.list"
seb02="./seb02_${runnumber}.list"
seb03="./seb03_${runnumber}.list"
seb04="./seb04_${runnumber}.list"
seb05="./seb05_${runnumber}.list"
seb06="./seb06_${runnumber}.list"
seb07="./seb07_${runnumber}.list"

hcaleast="./hcaleast_${runnumber}.list"
hcalwest="./hcalwest_${runnumber}.list"

mbd="./mbd_${runnumber}.list"
zdc="./zdc_${runnumber}.list"
ll1="./ll1_${runnumber}.list"
gl1="./gl1_${runnumber}.list"

./cups.py -r ${runnumber} -s 0 --dstname=DST_EVENT_auau23_${build}_${dbtag} running

ls -la

root.exe -q -b Fun4All_Combiner.C\(${nevents},\"${seb00}\",\"${seb01}\",\"${seb02}\",\"${seb03}\",\"${seb04}\",\"${seb05}\",\"${seb06}\",\"${seb07}\",\"${hcalwest}\",\"${hcaleast}\",\"${zdc}\",\"${mbd}\",\"${outputdir}\",\"${basefilename}\"\)

status_f4a=$?
./cups.py -r ${runnumber} -s 0 --dstname=DST_EVENT_auau23_${build}_${dbtag} finished -e ${status_f4a}

} >stdout.log 2>stderr.log

cat stdout.log
cat stdout.err

echo "script done"
