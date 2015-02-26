# vagrant-elk
Vagrant VM for Elasticsearch, Logstash, and Kibana 4

Create Ubuntu 14.04 VM with Elasticsearch, Logstash and Kibana 4.

* Elasticsearch will run as a service, and is available at http://localhost:9200
* Kibana (for now) must be started manually, and available at http://localhost:5601

Thanks to https://github.com/nurun/vagrant-elk for inspiration!

## Prerequisites
Install Vagrant see https://docs.vagrantup.com/v2/installation/index.html

## Installation
###### Start box
```Shell
vagrant up
```

## Testing
###### Logstash
A simple Logstash config is provided for testing.

```Shell
vagrant ssh
logstash -f /vagrant/logstash/conf/echo.conf
```

###### Kibana
A simple log file is provided for testing.  Run kibana manually (adding .init shortly, sorry!)

```Shell
vagrant ssh
cd /var/www/kibana
sudo bin/kibana
```

## Vagrant Controls
###### Start box
```Shell
vagrant up
```

###### SSH into box
```Shell
vagrant ssh
```
The default password is *vagrant*

###### Suspend and Resume
```Shell
vagrant suspend
vagrant resume
```

###### Tear down box
```Shell
vagrant destroy
```
