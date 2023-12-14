#!/bin/csh

set baseDir=`pwd`

setenv HOME /phenix/u/$LOGNAME
source /etc/csh.login
foreach i (/etc/profile.d/*.csh)
source $i
end
source /opt/sphenix/core/bin/sphenix_setup.csh -n ana.393
#source /opt/sphenix/core/bin/setup_local.csh /phenix/u/pinkenbu/workarea/sPHENIX/gitrepov5/install
echo "running " $1
cd ${baseDir}
pwd

./makelists.csh $1

set seb00="lists/seb00_$1.list"
set seb01="lists/seb01_$1.list"
set seb02="lists/seb02_$1.list"
set seb03="lists/seb03_$1.list"
set seb04="lists/seb04_$1.list"
set seb05="lists/seb05_$1.list"
set seb06="lists/seb06_$1.list"
set seb07="lists/seb07_$1.list"

set hcaleast="lists/hcaleast_$1.list"
set hcalwest="lists/hcalwest_$1.list"

set mbd="lists/mbd_$1.list"
set zdc="lists/zdc_$1.list"
set ll1="lists/ll1_$1.list"
set gl1="lists/gl1_$1.list"

root.exe -b -q  'Fun4All_Combiner.C(0, "'$seb00'", "'$seb01'", "'$seb02'", "'$seb03'", "'$seb04'", "'$seb05'", "'$seb06'", "'$seb07'", "'$hcalwest'", "'$hcaleast'", "'$zdc'", "'$mbd'")'

