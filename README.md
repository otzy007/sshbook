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
Execute ls on an aliased connection
```
sshbook local ls
```
Add a connection named local to localhost with the X forwarding (-Y) option
```
sshbook-add -o "-Y" local user@localhost
```
Add a connection based on the hostname got from the enviorment variable
```
sshbook-add -s ENV['HOSTNAME'] local user
```
Add a connection that executes ls by default when connecting
```
sshbook-add -c ls local user@localhost
```
Delete the "local" connection
```
sshbook -d local
```
Transfer a file
```
sshbook -t file host:/dest-dir
```
Transfer a folder to the users home
```
sshbook -t -r folder host
```

Install
=======
Just copy `sshbook` and `sshbook-add` from the bin folder to /usr/bin and `chmod a+x /usr/bin/sshbook`

.sshbook.yml configuration file
===============================
See [.sshbook.yml.example] (https://github.com/otzy007/sshbook/blob/master/.sshbook.yml.example) for a sample configuration.

NOTE: You can set a host or a script for a connection, not both of them.
The options tag is optional.

License
=======
sshbook is licensed under the MIT License. See [LICENSE.md] (https://github.com/otzy007/sshbook/blob/master/LICENSE.md) for details.
