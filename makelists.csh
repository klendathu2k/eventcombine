#!/bin/csh


rm lists/*_$1.list

ls /sphenix/lustre01/sphnxpro/commissioning/mbd/beam/*$1*.prdf > lists/mbd_$1.list

ls /sphenix/lustre01/sphnxpro/commissioning/GL1/beam/*$1*.prdf > lists/gl1_$1.list

ls /sphenix/lustre01/sphnxpro/commissioning/LL1/beam/*$1*.prdf > lists/ll1_$1.list

ls /sphenix/lustre01/sphnxpro/commissioning/emcal/beam/*seb00*$1*.prdf > lists/seb00_$1.list
ls /sphenix/lustre01/sphnxpro/commissioning/emcal/beam/*seb01*$1*.prdf > lists/seb01_$1.list
ls /sphenix/lustre01/sphnxpro/commissioning/emcal/beam/*seb02*$1*.prdf > lists/seb02_$1.list
ls /sphenix/lustre01/sphnxpro/commissioning/emcal/beam/*seb03*$1*.prdf > lists/seb03_$1.list
ls /sphenix/lustre01/sphnxpro/commissioning/emcal/beam/*seb04*$1*.prdf > lists/seb04_$1.list
ls /sphenix/lustre01/sphnxpro/commissioning/emcal/beam/*seb05*$1*.prdf > lists/seb05_$1.list
ls /sphenix/lustre01/sphnxpro/commissioning/emcal/beam/*seb06*$1*.prdf > lists/seb06_$1.list
ls /sphenix/lustre01/sphnxpro/commissioning/emcal/beam/*seb07*$1*.prdf > lists/seb07_$1.list

ls /sphenix/lustre01/sphnxpro/commissioning/ZDC/beam/*$1*.prdf > lists/zdc_$1.list

ls /sphenix/lustre01/sphnxpro/commissioning/HCal/beam/*East*$1*.prdf > lists/hcaleast_$1.list
ls /sphenix/lustre01/sphnxpro/commissioning/HCal/beam/*West*$1*.prdf > lists/hcalwest_$1.list

