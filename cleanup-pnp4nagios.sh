#!/bin/bash

folder="/var/pnp4nagios/perfdata"

files=$(grep -r "expected [0-9]* data source readings (got [0-9]*) from" $folder/*|awk -F":" '{print $1}')
for found in $(echo $files); do
  filename=${found%.*} 
	echo "Removing $filename.xml -- $filename.rrd"
 	rm $filename.xml
 	rm $filename.rrd
done
