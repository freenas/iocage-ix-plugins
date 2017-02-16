#!/bin/sh

get_port()
{
	while [ $# -gt 0 ]
	do
		if [ "$1" = "-p" ] ; then
			shift
			port="$1"
			break
		fi
		shift
	done
	if [ -z "$port" ] ; then
		port="4242"
	fi
	echo "$port"
}

get_sslmode()
{
	while [ $# -gt 0 ]
	do
		echo "$1" | grep -q "require-ssl"
		if [ $? -eq 0 ] ; then
			ssl="true"
			break
		fi
		shift
	done
	if [ -z "$ssl" ] ; then
		ssl="false"
	fi
	echo "$ssl"
}

get_ssloption()
{
   # Bogus value
   echo "tlsallow"
}

get_users()
{
  # Quasselcore is somewhat stupid and doesn't let you
  # list or delete users, keeping this here for example purposes
  echo "NA"
}

# Stub for something which gets quasselsettings
case $1 in
	port) 	serviceflags=`sysrc -n -f /etc/rc.conf quasselcore_args`
 		get_port $serviceflags ;;
	sslmode) serviceflags=`sysrc -n -f /etc/rc.conf quasselcore_args`
 		get_sslmode $serviceflags ;;
	ssloption) get_ssloption ;;
	deluser) get_users ;;
	*) echo "Unknown option" ;;
esac
