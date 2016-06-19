#!/bin/bash

export LC_ALL="en_US.utf8"
iptables --flush
/scripts/restartsrv_cpsrvd
systemctl restart mysql

rm -f /root/.my.cnf;
echo "[client]" > /root/.my.cnf;
echo "password=" >> /root/.my.cnf;
echo "user=root" >> /root/.my.cnf;

mysql_password=$(</dev/urandom tr -dc '12345!@#$%qwertQWERTasdfgASDFGzxcvbZXCVB' | head -c8; echo "");

mysql << EOF
use mysql;
SET PASSWORD FOR 'root'@'localhost' = PASSWORD('$mysql_password');
EOF

rm -f /root/.my.cnf
echo "[client]" > /root/.my.cnf
echo "password=$mysql_password" >> /root/.my.cnf
echo "user=root" >> /root/.my.cnf

cp /root/.my.cnf /root/.my.cnf.back

new_ip=$(ifconfig | grep 'inet'| grep -v '127.0.0.1'| cut -d: -f2 | awk '{ print $2}' |grep -v "10." |grep -v '^\s*$')
echo $new_ip > /var/cpanel/cpnat

/bin/bash
