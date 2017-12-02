docker run -d \
	-p 8883:8883 \
    -p 9883:9883 \
    -v /opt/mosquitto:/opt/mosquitto \
    -v /opt/mosquitto/logs:/var/log/mosquitto \
    -v /opt/mosquitto/certs/trusted:/etc/mosquitto/certs \
    --name=mosquitto-encrypted \
    docker-mosquitto
