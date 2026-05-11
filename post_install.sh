#!/bin/sh

plugin_name=$(hostname)

case "$plugin_name" in
    ansible-pull-syslogng-client)
	# Ansible needs UTF-8
	echo "LC_ALL=en_US.UTF-8" >> /root/.profile
	# Configure syslog-ng client
	mkdir /root/ansible-conf-syslogng-client
	cd /root/ansible-conf-syslogng-client
	ansible-pull -i hosts -U https://github.com/vbotka/ansible-conf-syslogng-client.git -d /root/ansible-conf-syslogng-client pb-logclient.yml
	;;
    ansible-pull-syslogng-server)
	# Ansible needs UTF-8
	echo "LC_ALL=en_US.UTF-8" >> /root/.profile
	# Configure syslog-ng server
	mkdir /root/ansible-conf-syslogng-server
	cd /root/ansible-conf-syslogng-server
	ansible-pull -i hosts -U https://github.com/vbotka/ansible-conf-syslogng-server.git -d /root/ansible-conf-syslogng-server pb-logserv.yml
	;;
esac
