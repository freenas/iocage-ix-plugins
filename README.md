# iocage-ix-plugins
Official iXsystems iocage plugins for FreeNAS and TrueOS

Plugin Json files are added to this repo, along with a respective icon in icons/

When a plugin is made 'official' it should be added to the INDEX json and
it will appear in iocage's plugin listing

Installing Plugins:

iocage fetch -P <path-to-plugins>/jenkins.json ip4_addr="re0|192.168.0.100/24" tag=jenkins
