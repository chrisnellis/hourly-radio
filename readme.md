This is a repo that documents the various scripts I used to create a server that loops a different song every hour.

The architecture is simple; a single VM runs the [icecast server](http://icecast.org/) that broadcasts audio, as well as a [Liquidsoap server](https://www.liquidsoap.info/) that manages the audio to broadcast.

I deployed this on GCP with a compute engine and a separate persistent disk that stored the media. To hide the server password, I employed Google's Secrets Manager to safely store and retreive the password.

I made the following modifications to a default compute engine instance before running:
* Open port 8000 to allow clients to connect to icecast
* Grant the instance read access to the secrets manager through a separate service account on Google IAM
* As a matter of preference, I used Ubuntu 18.04 LTS instead of the default container image provided by Google

In this repo, you'll see:
* [A startup script to mount a disk to the instance and set the timezone](mount.sh)
* [An installation](icecast/install.sh) and [startup script](icecast/startup.sh) for the icecast server component
    * The script sets up logs files on my home directory
    * The script also overwrites the default password with the password from Secrets Manager
    * A copy of the [default icecast configuration file](icecast/icecast.xml) for reference
* [A Liquidsoap script that plays a different song each out](timer.liq)
* [An installation](liquidsoap/install.sh) and [startup script](liquidsoap/startup.sh) for Liquidsoap that starts liquidsoap in the background