#!/bin/bash

export LC_ALL="en_US.utf8"
iptables --flush
/scripts/restartsrv_cpsrvd
systemctl restart mysql
/bin/bash
