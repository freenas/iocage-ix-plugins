#!/bin/sh

: ${quasselcore_data="/var/db/quasselcore"}
: ${quasselcore_log="/var/log/quasselcore.log"}
: ${quasselcore_listen="0.0.0.0,::"}

# Enable the service
sysrc -f /etc/rc.conf quasselcore_args="--configdir=${quasselcore_data} --logfile=${quasselcore_log} --listen=${quasselcore_listen} --ssl-cert=${quasselcore_data}/quasselCert.pem --require-ssl"
sysrc -f /etc/rc.conf quasselcore_enable="YES"

# Make the default DB dir
mkdir -p /var/db/quasselcore
chown quasselcore:quasselcore /var/db/quasselcore

# Gen the SSL key
printf "\n\n\n\n\n\n\n\n\n\n" | /usr/local/etc/rc.d/quasselcore onekeygen 2>/dev/null >/dev/null

# Start the service
if $(service quasselcore start 2>/dev/null >/dev/null) ; then
    echo "Starting quasselcore."
fi
