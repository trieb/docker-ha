# Home Automation in Docker

## mosquitto 

Change ower
`sudo chown -R mosquitto:mosquitto mosquitto/`

## openHAB

Create user for openhan without home or shell 
`sudo useradd -r -s /sbin/nologin openhab`

Add regular user to the `openhab`group
`sudo usermode -a -G openhab mikael`

Make sure the user `openhab` own the openhab directories
`sudo chown -R openhab:openhab openhab/`

<uid> // id openhab
<gid>  
<version>
<architecture>
<distribution>
