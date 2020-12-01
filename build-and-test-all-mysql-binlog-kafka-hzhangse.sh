#! /bin/bash

set -e

export DATABASE=mysql
export MODE=binlog
export BROKER=kafka
#设置网卡ech0的ip地址为docker_host
export DOCKER_HOST_IP=`ifconfig eth0 |awk -F '[ :]+' 'NR==2{print $4}'`
. ./set-env-mysql-binlog.sh

./_build-and-test-all-hzhangse.sh
