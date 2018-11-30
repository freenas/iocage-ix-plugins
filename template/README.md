# Iocage Plugin Artifact Template

This is an example of what a typical plugin "artifact" git repo will contain.

Artifacts are where 3rd party scripts and settings are stored for a particular plugin.

They allow you do run Post Install actions, which are often required to enable
specific services or perform other post package setup.

# File Documentation

 - `post_install.sh`

This script is run *inside* the jail after it has been created and packages installed.

Typically you will enable services in /etc/rc.conf that need to start with the jail startup,
apply configuration settings, etc.


 - `ui.json`

Json file that accepts the following key/value options:

- `adminportal : "http://%%IP%%/"`

Plugin's web-interface for control / configuration. %%IP%% will be replaced dynamically withe the jails IP address.

 - `overlay/`

Directory of files that will be copied on top of the jail post-install. I.E. usr/local/bin/myfile will
be placed in the jails /usr/local/bin/myfile location. Can be used to supply custom files / configuration
data, scripts and more.

 - `settings.json`

JSON file which controls plugins settings interface (Both iocage CLI and GUI of TrueOS / FreeNAS)

The required fields include:

- `"servicerestart" : "service plexmediaserver restart"`

  Command to run when restarting service after changing settings

- `"serviceget" : "/usr/local/bin/myget"`

  Points to the command used to get values for plugin configuration. Usually will be provided by the plugin creator, can be any language as long as it takes a single "key" argument, and returns the setting text.

- `"serviceset" : "/usr/local/bin/myset"`

  Points to the command used to set values for plugin configuration. Will be provided by the plugin creator, can be any language as long as it accepts two arguments for key/value pair.

- `"options": { }`

  The following subsection will contain arrays of elements, starting with the "key" name and required arguments
for that particular type of setting. Example:


```
"options": {
		"adduser": {
			"type": "add",
			"name": "Add User",
			"description": "Add new quasselcore user",
			"requiredargs": {
				"username": {
					"type": "string",
					"description": "Quassel Client Username"
				},
				"password": {
					"type": "password",
					"description": "Quassel Client Password"
				},
				"fullname": {
					"type": "string",
					"description": "Quassel Client Full Name"
				}
			},
			"optionalargs": {
				"adminuser": { 
					"type": "bool",
					"description": "Can this user administrate quasselcore?"
				}
			}
		},
		"port": {
			"type": "int",
			"name": "Quassel Core Port",
			"description": "Port for incoming quassel connections",
			"range": "1024-32000",
			"default": "4242",
			"requirerestart": true
		},
		"sslmode": {
			"type": "bool",
			"name": "SSL Only",
			"description": "Only accept SSL connections",
			"default": true,
			"requirerestart": true
			
		},	
		"ssloption": {
			"type": "combo",
			"name": "SSL Options",
			"description": "SSL Connection Options",
			"requirerestart": true,
			"default": "tlsallow",
			"options": {
					"tlsrequire": "Require TLS",
					"tlsallow": "Allow TLS",
					"tlsdisable": "Disable TLS"
			}
		},
		"deluser": {
			"type": "delete",
			"name": "Delete User",
			"description": "Remove a quasselcore user"
		}

}
```
