# Unifi-EFK-Stack
A simple EFK-Stack (Elastic, Fluent-Bit, Kibana) as a remote syslog server solution for unifi products.

## Requirements
* Docker 1.12.0 or above
* Docker-Compose
* Linux Host (MacOS or Windows Docker Versions almost lead to sadness. Read Advanced Usage guide below)

## Install and Run
* Checkout this project in a folder where your elasticsearch data can be stored
* Change the SERVER_NAME environment variable in the docker-compose.yml to your domainname (Not absolutely necessary)
* Execute the run.sh
* The syslog remoteserver port will be by defautl 541 (configre this in your unifi controller under Settings->Sites)
* Kibana is accessible at your linux-machine by the port 5601

## Customize
* The port of the syslog listner of fluentbit is changeable in the docker-compose.yml (Port-Mapping) or fundamentally changed in the confg/fluent-bit/fluent-bit.conf (Dont forget to change the mapping too then)
* The port of kibana is also changeable in the docker-compose.yml (Port-Mapping)
* You can change the data directory by modifying the volumemount defintion in the docker-compose file (Dont forget that the run.sh creates the default data directories which then will be obsolete)

## Advanced Usage
* You can write fluent-bit parser to parse the log message into more readbable ones or even add dedicated field like source_ip and so on.
* If you want to use your elasticsearch instance for other use-caes as well, you can port-forward 9200 outside the docker-container in the docker-compose.yml (Be aware, this is only a single node instance of elasticsearch)
* Windows or MacOS Versions of Docker got massive problems with volume-mounts and port-forwardings. Those versions are simple virtual-machines of linux running docker-inside. Its creppy to mount another mount inside a virtual machine and nearly not debuggable if something dont work as planned.