SSH address book
================
[![Build Status](https://travis-ci.org/otzy007/storeip.png?branch=master)](https://travis-ci.org/otzy007/storeip)

This application reads it's configuration from the .sshbook.yml file located
into the home directory(eg: /home/user/.sshbook.yml) and starts a ssh terminal.

Usage
=====
```
sshbook connection [command]
```
See sshbook -h for more

Examples
========
Execute ls on a stored connection
```
sshbook local ls
```
Add a connection named local to localhost with the X forwarding (-Y) option
```
sshbook -a -o -Y local user@localhost
```
Add a connection based on the hostname read from /etc/HOSTNAME
```
sshbook -a -s "cat /etc/HOSTNAME" local user
```
Delete the local connection
```
sshbook -d local
```
.sshbook.yml configuration file
===============================
See [.sshbook.yml.example] (https://github.com/otzy007/sshbook/blob/master/.sshbook.yml.example) for a sample configuration.

NOTE: You can set a host or a script for a connection, not both of them.
The options tag is optional.

License
=======
sshbook is licensed under the MIT License. See [LICENSE.md] (https://github.com/otzy007/sshbook/blob/master/LICENSE.md) for details.