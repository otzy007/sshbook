#!/bin/bash

VERSION=0.1

if [ -d /tmp/sshbook ]; then
   rm -r /tmp/sshbook
fi

mkdir -p /tmp/sshbook/usr/bin
mkdir /tmp/sshbook/install
mkdir -p /tmp/sshbook/usr/share/doc/sshbook-$VERSION

cp ../../sshbook /tmp/sshbook/usr/bin
cp slack-desc /tmp/sshbook/install
cp ../../README.md /tmp/sshbook/usr/share/doc/sshbook-$VERSION
cd /tmp/sshbook

/sbin/makepkg -l y -c n /tmp/sshbook-$VERSION-noarch-1oz.txz