#! /bin/sh


docker ps -a | awk '{ print $1,$2 }' | grep projetoarcanjo/pleione:1.0 | awk '{print $1 }' | xargs -I {} docker rm -f {}
docker rmi projetoarcanjo/pleione:1.0

docker build \
--tag=projetoarcanjo/pleione:1.0 \
--rm=true .

docker run --name pleione --hostname=pleione \
-e USERNAME=postgres \
-e PASS=admin \
-e GEOSERVER_ADMIN_PASSWORD=@rcanjo \
-v /etc/localtime:/etc/localtime:ro \
-p 36212:8080 \
-d projetoarcanjo/pleione:1.0

docker network connect arcanjo pleione

echo "Aguardando a imagem... (15 segundos)"
sleep 15

docker exec pleione /home/pleione/install-cartas.sh

