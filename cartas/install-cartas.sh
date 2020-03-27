#! /bin/bash

cd /home/pleione/

restapi=http://localhost:8080/geoserver/rest
login=admin:@rcanjo
workspace=marinha

echo "Criar workspace $workspace" 
curl -v -u $login -XPOST -H "Content-type: text/xml" \
	-d "<workspace><name>$workspace</name></workspace>" \
	$restapi/workspaces

echo "Criar datastores"	

for sldfile in *.tif; do
    cvstorename=`basename $sldfile .tif`
	
    curl -v -u $login -XPUT -H "Content-type: image/tiff"  \
    --data-binary @$sldfile $restapi/workspaces/$workspace/coveragestores/$cvstorename/file.geotiff	

done

rm -rf /home/pleione/*.tif