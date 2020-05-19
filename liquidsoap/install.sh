# install liquidsoap
sudo apt-get install -y liquidsoap=1.1.1-7.2ubuntu1

# remove admin and default landing page interface
sudo rm -rf /etc/icecast2/web
sudo rm -rf /etc/icecast2/admin

# pull in default icecast config file
sudo cp /etc/icecast2/icecast.xml .
sudo chown $(whoami) icecast.xml