#! /bin/sh
if [ ! -f /var/lib/cloud/firsttime ]
then
        rm -rf /var/lib/cloud
        /usr/bin/cloud-init init
        /usr/bin/cloud-init modules --mode=config
        touch /var/lib/cloud/firsttime
        touch /var/lib/cloud/instance/warnings/.skip
fi
