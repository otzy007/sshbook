SSH address book
================

This application reads it's configuration from the .sshbook.yml file located
into the home directory(eg: /home/user/.sshbook.yml) and starts a ssh terminal.

Usage
=====
```
sshbook connection [command]
```

.sshbook.yml configuration file
===============================
See [.sshbook.yml.example] (https://github.com/otzy007/sshbook/blob/master/.sshbook.yml.example) for a sample configuration.

NOTE: You can set a host or a script for a connection, not both of them.
The options tag is optional.

License
=======
sshbook is licensed under the MIT License. See [LICENSE.md] (https://github.com/otzy007/sshbook/blob/master/LICENSE.md) for details.