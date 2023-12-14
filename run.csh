#!/bin/csh

set baseDir=`pwd`

set nevents=$1
set basefilename=$2
set baselogname=$3
set outputdir=$4
set runnumber=$5
set clusterid=$6
set procid=$7
set build=$8:s/.//
set dbtag=$9

./cups.py -r ${runnumber} -s 0 --dstname=DST_EVENT_auau23_${build}_${dbtag} started

setenv HOME /phenix/u/$LOGNAME
source /etc/csh.login
foreach i (/etc/profile.d/*.csh)
source $i
end
source /opt/sphenix/core/bin/sphenix_setup.csh -n ${8}
#source /opt/sphenix/core/bin/setup_local.csh /phenix/u/pinkenbu/workarea/sPHENIX/gitrepov5/install
echo "running " ${runnumber}
cd ${baseDir}
pwd

#./makelists.csh $1

set seb00="./seb00_${runnumber}.list"
set seb01="./seb01_${runnumber}.list"
set seb02="./seb02_${runnumber}.list"
set seb03="./seb03_${runnumber}.list"
set seb04="./seb04_${runnumber}.list"
set seb05="./seb05_${runnumber}.list"
set seb06="./seb06_${runnumber}.list"
set seb07="./seb07_${runnumber}.list"

set hcaleast="./hcaleast_${runnumber}.list"
set hcalwest="./hcalwest_${runnumber}.list"

set mbd="./mbd_${runnumber}.list"
set zdc="./zdc_${runnumber}.list"
set ll1="./ll1_${runnumber}.list"
set gl1="./gl1_${runnumber}.list"

#echo 0 DST_EVENT_auau23_pro_2023p009-00022026-0000 22026 80160 0

./cups.py -r ${runnumber} -s 0 --dstname=DST_EVENT_auau23_${build}_${dbtag} running

#(command > stdoutfile) >& stderrfile
#root.exe -b -q  Fun4All_Combiner.C'(0, "'$seb00'", "'$seb01'", "'$seb02'", "'$seb03'", "'$seb04'", "'$seb05'", "'$seb06'", "'$seb07'", "'$hcalwest'", "'$hcaleast'", "'$zdc'", "'$mbd'")'
root.exe -q -b Fun4All_Combiner.C\(${nevents},\"${seb00}\",\"${seb01}\",\"${seb02}\",\"${seb03}\",\"${seb04}\",\"${seb05}\",\"${seb06}\",\"${seb07}\",\"${hcalwest}\",\"${hcaleast}\",\"${zdc}\",\"${mbd}\",\"${outputdir}\",\"${basefilename}\"\)
set status_fun4all=${status}

#./cups.py -r ${runnumber} -s 0 --dstname=DST_EVENT_auau23_${build}_${dbtag} finished
./cups.py -r ${runnumber} -s 0 --dstname=DST_EVENT_auau23_${build}_${dbtag} finished -e ${status_fun4all}
