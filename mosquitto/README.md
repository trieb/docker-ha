## Mosquitto MQTT broker image

## Usage

Clone repo:

* `git clone https://github.com/trieb/docker-mosquitto.git`
* `cd docker-mosquitto`

#### Docker

Build image:

`docker build -t docker-mosquitto .`

Run comtainer:

`docker run -d docker-mosquitto`

#### docker-compose

Build images:

`docker-compose build`

Start service:

`docker-compose up`
`docker-compose down`

### Port mapping

* `tcp/1883  MQTT port`
* `tcp/8883  MQTT port SSL/TLS`
* `tcp/9001  websocket`
* `tcp/9883  websocket SSL/TLS`

## Security

* Node that .acl and .passwd-files are located under /config/conf.d/.

## Problems

If you get:

`Error: Unable to open log file /var/log/mosquitto/mosquitto.log for writing.`

make sure that the files in the directory `log` are writable.

Try:

`sudo chwon -R $USER:$USER log/`

and create an empty file:

* `touch log/moquitto.log`
* `sudo chmod 777 log/mosquitto.log`
