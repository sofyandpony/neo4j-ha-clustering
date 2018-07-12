#!/bin/bash


sudo yum install wget gcc pure-static pure-devel -y

wget https://www.haproxy.org/download/1.7/src/haproxy-1.7.8.tar.gz -O ~/haproxy.tar.gz

tar xzvf ~/haproxy.tar.gz -C ~/

cd ~/haproxy-1.7.8

make TARGET=linux2628

sudo make install

sudo mkdir -p /etc/haproxy
sudo mkdir -p /var/lib/haproxy 
sudo touch /var/lib/haproxy/stats

sudo ln -s /usr/local/sbin/haproxy /usr/sbin/haproxy

sudo mv /etc/haproxy/haproxy.cfg /etc/haproxy/haproxy.cfg.backup

sudo ln -s /usr/local/sbin/haproxy /usr/sbin/haproxy

sudo cp ~/haproxy-1.7.8/examples/haproxy.init /etc/init.d/haproxy
sudo chmod 755 /etc/init.d/haproxy
sudo systemctl daemon-reload

sudo chkconfig haproxy on

sudo useradd -r haproxy

sudo firewall-cmd --permanent --zone=public --add-service=http
sudo firewall-cmd --permanent --zone=public --add-port=2080/tcp
sudo firewall-cmd --permanent --zone=public --add-port=2088/tcp

sudo firewall-cmd --reload

sudo cp ./haproxy.cfg /etc/haproxy/


sudo systemctl restart haproxy
