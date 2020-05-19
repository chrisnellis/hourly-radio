# pull password into env var
pass=$(gcloud secrets versions access latest --secret="icecast-password")

mkdir -p logs/liquidsoap

# replace password in liquidsoap script
sed -i "s:hackme:$pass:g" timer.liq

# start liquidsoap in Daemon mode
liquidsoap -d timer.liq