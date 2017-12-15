# Home Automation in Docker

## mosquitto

Change owner

* `sudo chown -R mosquitto:mosquitto mosquitto/`

## openHAB

Create user for openhab without home or shell

* `sudo useradd -r -s /sbin/nologin openhab`

Add regular user to the `openhab`group

* `sudo usermode -a -G openhab mikael`

Make sure the user `openhab` own the openhab directories

* `sudo chown -R openhab:openhab openhab/`

### Addons

1. Place `openhab-addons-2.1.0.kar.kar` in `/opt/openhab/addons/`
2. Edit `addons.cfg under `/opt/openhab/conf/services/`
3. Add corresponding config files `<addon>.cfg` under `/opt/openhab/conf/services/`

You can find templates for the condig files under `./addon_configurations/`.

Example of addons:

* Astro
* Mail
* Mqtt
* Nma
* Hue
* OwnTracks
* NetworkHealth
* RfxCom
* Weather
* TTS
* MyOpenhabCloud
* ChromeCast
* HTTP

### Problems

When I first added the `mqtt.cfg` it had a missed to enter username and passord for the broker. I then removed the `mqtt.config` under `/opt/openhab/userdata/config/org/openhab`
and restarted openhab.

## Influxdb

### Documentation

https://hub.docker.com/_/influxdb/

### Create the database and the users

```
$ influx
Connected to http://localhost:8086 version 0.13
InfluxDB shell version: 0.13
> CREATE DATABASE openhab_db
> CREATE USER admin WITH PASSWORD 'adminpassword123+' WITH ALL PRIVILEGES
> CREATE USER openhab WITH PASSWORD 'openhabpassword123-'
> CREATE USER grafana WITH PASSWORD 'grafanapassword123?'
> GRANT ALL ON openhab_db TO openhab
> GRANT READ ON openhab_db TO grafana
> exit
```

### Using the API to setup database

Use the API to create the database and the users:

```
$ curl -i -XPOST  http://localhost:8086/query --data-binary "q=CREATE DATABASE openhab_db"
$ curl -i -XPOST  http://localhost:8086/query --data-binary "q=CREATE USER admin WITH PASSWORD 'adminpassword123' WITH ALL PRIVILEGES"
$ curl -i -XPOST  http://localhost:8086/query --data-binary "q=CREATE USER openhab WITH PASSWORD 'openhabpassword123'"
$ curl -i -XPOST  http://localhost:8086/query --data-binary "q=CREATE USER grafana WITH PASSWORD 'grafanapassword123'"
$ curl -i -XPOST  http://localhost:8086/query --data-binary "q=GRANT ALL ON openhab_db TO openhab"
$ curl -i -XPOST  http://localhost:8086/query --data-binary "q=GRANT READ ON openhab_db TO grafana"
```

### Ports

* 8086 HTTP API port
* 8083 Administrator interface port, if it is enabled
* 2003 Graphite support, if it is enabled


## Telegraf
