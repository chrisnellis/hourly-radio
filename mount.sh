# First time formatting instructions: https://cloud.google.com/compute/docs/disks/add-persistent-disk#formatting

# create mountpoint for audio
sudo mkdir -p /media/icecast-disk/

# mount secondary disk to mountpoint
sudo mount -o discard,defaults /dev/sdb /media/icecast-disk

# set the timezone to EST
sudo timedatectl set-timezone America/New_York