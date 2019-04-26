#!/bin/bash

set -o errexit

scripts_dir="$(dirname "${BASH_SOURCE[0]}")"

# make sure we're running as the owner of the checkout directory
RUN_AS="$(ls -ld "$scripts_dir" | awk 'NR==1 {print $3}')"
if [ "$USER" != "$RUN_AS" ]
then
    echo "This script must run as $RUN_AS, trying to change user..."
    exec sudo -u $RUN_AS $0
fi
cd /home/${USER}/  
sudo chmod +x /home/${USER}/Switch/scripts/service-installer.sh  
sudo /home/${USER}/Switch/scripts/service-installer.sh 
sudo chmod +x /home/${USER}/Switch/scripts/shutdown.sh  
sudo systemctl enable on-off-pushbutton.service  
echo "Added the safe shutdown service. Start the service by entering 'sudo systemctl start on-off-pushbutton.service' in the terminal"  
