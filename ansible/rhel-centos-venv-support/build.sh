#!/bin/sh

# All that is needed for running ansible under a virtualenv

yum -y install python-virtualenv.noarch gcc.x86_64 gmp-devel.x86_64 libyaml-devel.x86_64 libselinux-python.x86_64 openssl-devel.x86_64
yum -y install libcurl-devel.x86_64

/bin/virtualenv-2.7 /var/lib/ansible-python

# We do the following because certain system python modules are not able to install via pip
cp -a /usr/lib64/python2.7/site-packages/selinux /var/lib/ansible-python/lib64/python2.7/site-packages/
cp -a /usr/lib64/python2.7/site-packages/rpm /var/lib/ansible-python/lib64/python2.7/site-packages/
cp -a /usr/lib/python2.7/site-packages/rpmUtils /var/lib/ansible-python/lib64/python2.7/site-packages/
cp -a /usr/lib64/python2.7/site-packages/sqlitecachec.py* /var/lib/ansible-python/lib64/python2.7/site-packages/
cp /usr/lib64/python2.7/site-packages/_sqlitecache.so /var/lib/ansible-python/lib64/python2.7/site-packages/
cp -a /usr/lib/python2.7/site-packages/yum /var/lib/ansible-python/lib64/python2.7/site-packages/

. /var/lib/ansible-python/bin/activate
/var/lib/ansible-python/bin/pip-2.7 install ansible==2.0.1.0
export PYCURL_SSL_LIBRARY=nss
/var/lib/ansible-python/bin/pip-2.7 install pycurl==7.43.0
/var/lib/ansible-python/bin/pip-2.7 install urlgrabber==3.9.1
