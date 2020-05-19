# pull password into env var
pass=$(gcloud secrets versions access latest --secret="icecast-password")

# replace the default password with the one loaded in from GCP
sed -i "s:hackme:$pass:g" icecast.xml

# set up space for icecast logs
mkdir -p logs/icecast2
touch logs/icecast2/access.log
touch logs/icecast2/error.log

# use home directory as location for logs
sed -i 's:/var/log/icecast2:/home/chris/logs/icecast2:g' icecast.xml

# start icecast2 with the defined config in the background
icecast2 -c icecast.xml -b