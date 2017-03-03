#!/bin/bash

set -e

build-server-block () {

  DOMAIN="lol.com"

while read line
do
    eval echo "$line"
done < "./certs.conf"

}



build-server-block > lol.txt