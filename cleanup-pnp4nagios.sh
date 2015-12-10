#!/bin/bash

folder="${1:-/var/pnp4nagios/perfdata}"

files=$(egrep -l "(expected [0-9]* data source readings (got [0-9]*) from|found extra data on update argument)" $(find ${folder} -name '*.xml'))

for found in $(echo $files); do
  filename=${found%.*} 
	echo "Removing $filename.xml -- $filename.rrd"
 	rm $filename.xml
 	rm $filename.rrd
done
