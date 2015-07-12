#!/bin/bash
URL='www.domain.de'
wget --quiet http://$URL/sitemap.xml --no-cache --output-document - | egrep -o "http://$URL[^<]+" | while read line; do
  time curl -A 'Cache Warmer' -s -L $line > /dev/null 2>&1
	echo $line
done
