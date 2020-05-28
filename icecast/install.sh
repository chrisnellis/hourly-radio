# install icecast 2
sudo DEBIAN_FRONTEND=noninteractive apt-get -yq install icecast2

# remove admin and default landing page interface
sudo rm -rf /etc/icecast2/web
sudo rm -rf /etc/icecast2/admin

# pull in default icecast config file
sudo cp /etc/icecast2/icecast.xml .
sudo chown $(whoami) icecast.xml