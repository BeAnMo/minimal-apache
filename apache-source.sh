#!/bin/bash

# RUN WITH SUDO, NO WAIT DON'T

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

printf '\nDownloading needed libraries\n'
sudo apt-get install libpcre3 libpcre3-dev libexpat1-dev gcc build-essential
