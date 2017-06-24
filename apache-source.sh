#!/bin/bash

# courtesy of netnea.com's Apache compiling tutorial by Christian Folini
# https://www.netnea.com/cms/apache-tutorial-1_compiling-apache/

# RUN WITH SUDO, NO WAIT DON'T

# make a source code dir: /usr/src/apache
# chown of source dir to user/whoami
# run script from source dir

# libtoolT issue:
# After configuring the source code, 'make' will stop with errors
# relating to 'htpasswd' and undefined 'XML_' methods.
# The following modifications seem to solve these problems.

# on line 30000 or so of ./apr-1.6.2/configure file:
# change:
#	trap "$RM \"$cfgfile\"; ... (rest of line is fine)
# to:
#	trap "$RM -f \"$cfgfile\"; ...
# on the line below, change:
# 	$RM "$cfgfile"
# to:
# 	$RM -f "$cfgfile"	

# remember to 'f'

# cannot configure/build Apache without these
printf '\nDownloading needed libraries\n'
sudo apt-get install libpcre3 libpcre3-dev libexpat1-dev gcc build-essential


printf '\nDownloading Apache Portable Runtime\n'
# apr
wget http://www-us.apache.org/dist//apr/apr-1.6.2.tar.bz2
# apr md5
wget http://www.apache.org/dist/apr/apr-1.6.2.tar.bz2.md5

printf '\nDownloading APR-UTIL\n'
# apr-util
wget http://www-us.apache.org/dist//apr/apr-util-1.6.0.tar.bz2
# apr-util md5
wget http://www.apache.org/dist/apr/apr-util-1.6.0.tar.bz2.md5

printf '\nChecking integrity\n'
# check integrity exit program if not 'OK'
md5sum --check apr-1.6.2.tar.bz2.md5
md5sum --check apr-util-1.6.0.tar.bz2.md5

printf '\nUncompressing tarballs\n'
tar -xvjf apr-1.6.2.tar.bz2
tar -xvjf apr-util-1.6.0.tar.bz2

printf '\nDownloading Apache 2.4.xx\n'
# apache server
wget http://www-us.apache.org/dist//httpd/httpd-2.4.26.tar.bz2
# server sha1
wget http://www-us.apache.org/dist/httpd/httpd-2.4.26.tar.bz2.sha1

printf '\nUncompressing server tarball\n'
tar -xvjf httpd-2.4.26.tar.bz2


