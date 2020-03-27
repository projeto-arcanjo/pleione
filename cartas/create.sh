#!/bin/bash


restapi=http://localhost/osmope/rest
login=admin:geoservercasnav@#$
workspace=cartasnauticas


for tiffile in *.tif; do

        storename=`basename $tiffile .tif`


	curl -u $login -v -XPOST -H "Content-type: application/xml"   \
		-d "<coverageStore><name>cs_$storename</name><workspace>$workspace</workspace><enabled>true</enabled></coverageStore>"   \
		$restapi/workspaces/$workspace/coveragestores


	curl -u $login -v -XPUT -H "Content-type: image/tiff"   \
    		--data-binary @$tiffile   \
		$restapi/workspaces/$workspace/coveragestores/cs_$storename/file.geotiff




done

