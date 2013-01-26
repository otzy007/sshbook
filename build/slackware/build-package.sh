#!/bin/bash

VERSION=0.1.2
TEMPDIR=/tmp/sshbook-$VERSION
if [ -d $TEMPDIR ]; then
   rm -rf $TEMPDIR
fi

mkdir -p $TEMPDIR/usr/bin
mkdir $TEMPDIR/install
mkdir -p $TEMPDIR/usr/share/doc/sshbook-$VERSION

cp ../../sshbook $TEMPDIR/usr/bin
cp slack-desc $TEMPDIR/install
cp ../../README.md $TEMPDIR/usr/share/doc/sshbook-$VERSION
cd $TEMPDIR

/sbin/makepkg -l y -c n /tmp/sshbook-$VERSION-noarch-1oz.txz