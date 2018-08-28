# alpine-mosquitto

[![Build status](https://ci.appveyor.com/api/projects/status/bhma7tmx0eje73ao/branch/master?svg=true)](https://ci.appveyor.com/project/boomalien/alpine-mosquitto/branch/master)
[![This image on DockerHub](https://img.shields.io/docker/pulls/boomalien/alpine-mosquitto.svg)](https://hub.docker.com/r/boomalien/alpine-mosquitto/)


mosquitto docker image 

# Example Run Command

#create local directories \
mkdir -p /smartHome/mosquitto \
mkdir -p /smartHome/mosquitto/data \
mkdir -p /smartHome/mosquitto/log 

#crate a simple mosquitto.conf \
sudo bash -c "echo ""persistence true"" | tee -a /opt/mosquitto/data/mosquitto.conf" \
sudo bash -c "echo ""persistence_location /mosquitto/data/"" | tee -a /opt/mosquitto/data/mosquitto.conf" \
sudo bash -c "echo ""log_dest file /mosquitto/log/mosquitto.log"" | tee -a /opt/mosquitto/data/mosquitto.conf" 

#run container
docker run -it -p 1883:1883 -p 9001:9001 \
--name alpine-mosquitto \
-v /smartHome/mosquitto/data/mosquitto.conf:/mosquitto/data/mosquitto.conf \
-v /smartHome/mosquitto/data:/mosquitto/data \
-v /smartHome/mosquitto/log:/mosquitto/log \
--restart=always \
boomalien/alpine-mosquitto
