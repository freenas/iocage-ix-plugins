#!/bin/sh

set_port()
{
	newargs=""
	while [ $# -gt 0 ]
	do
		if [ "$1" = "-p" ] ; then
			shift
			shift
			continue
		fi
		newargs="$newargs $1"
		shift
	done
	newargs="$newargs -p $NEWPORT"
	sysrc -f /etc/rc.conf quasselcore_args="$newargs"
	exit 0
}

set_sslmode()
{
	newargs=""
	while [ $# -gt 0 ]
	do
		if [ "$1" = "--require-ssl" ] ; then
			shift
			continue
		fi
		newargs="$newargs $1"
		shift
	done
	if [ "$NEWSSLMODE" = "true" ] ; then
		newargs="$newargs --require-ssl"
	fi
	sysrc -f /etc/rc.conf quasselcore_args="$newargs"
	exit 0

}

set_ssloption()
{
   # Bogus value
   echo "tlsallow"
}

adduser()
{
	# Retarded how you add users to quassel
	# Example only
	printf "$1\n$2\n$2\n" | quasselcore --configdir=/var/db/quassel --add-user
}

# Stub for something which sets quasselsettings
case $1 in
	port) 	serviceflags=`sysrc -n -f /etc/rc.conf quasselcore_args`
		NEWPORT="$2"
 		set_port $serviceflags ;;
	sslmode) serviceflags=`sysrc -n -f /etc/rc.conf quasselcore_args`
		NEWSSLMODE="$2"
 		set_sslmode $serviceflags ;;
	ssloption) set_ssloption ;;
	adduser) adduser "$2" "$3" ;;
	*) echo "Unknown option" ;;
esac
