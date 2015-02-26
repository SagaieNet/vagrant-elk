#!/usr/bin/env bash

# Versions: Select current / compatible from
# http://www.elasticsearch.org/overview/elkdownloads
elasticsearchVersion="1.4.4"
logstashVersion="1.4.2-1-2c0f5a1_all"
kibanaVersion="4.0.0-linux-x64"

echo "Start VM Provision"
echo "=========================================="

# Oracle JDK is recommended
sudo add-apt-repository ppa:webupd8team/java
sudo apt-get update

# Prerequisites
echo "Installing apt packages"
sudo apt-get install -y default-jre-headless curl unzip
sudo apt-get update

cd /tmp
echo "Installing elasticsearch ${elasticsearchVersion}"
wget -q https://download.elasticsearch.org/elasticsearch/elasticsearch/elasticsearch-${elasticsearchVersion}.deb
sudo dpkg -i elasticsearch-${elasticsearchVersion}.deb 
rm elasticsearch-${elasticsearchVersion}.deb
# make elasticsearch auto-start
sudo update-rc.d elasticsearch defaults 95 10
sudo /etc/init.d/elasticsearch start

cd /tmp
echo "Installing logstash ${logstashVersion}"
wget -q https://download.elasticsearch.org/logstash/logstash/packages/debian/logstash_${logstashVersion}.deb
sudo dpkg -i logstash_${logstashVersion}.deb
rm logstash_${logstashVersion}.deb

# add logstash environment variables
echo "export PATH=/opt/logstash/bin:\$PATH" >> ~/.bashrc

cd /tmp
echo "Installing kibana ${kibanaVersion}"
# TODO: run Kibana as /etc/init.d service
wget -q https://download.elasticsearch.org/kibana/kibana/kibana-${kibanaVersion}.tar.gz
sudo tar xvf kibana-${kibanaVersion}.tar.gz
sudo mkdir -p /var/www/kibana
sudo cp -R kibana-${kibanaVersion}/* /var/www/kibana/
sudo rm kibana-${kibanaVersion}.tar.gz
sudo rm -rf kibana-${kibanaVersion}


# reset bash
source ~/.bashrc

echo ""
echo "=========================================="
java -version
echo "Installed elasticsearch ${elasticsearchVersion}"
echo "Installed logstash ${logstashVersion}"
echo "Installed kibana ${kibanaVersion}"
echo "End VM Provision"

