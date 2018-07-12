
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

sudo cp ./haproxy.cfg /etc/haproxy/


sudo service haproxy start