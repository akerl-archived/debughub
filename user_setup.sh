#!/usr/bin/env bash

cd $(dirname "${BASH_SOURCE[0]}")/src

if [[ -z "$1" ]] ; then
    user='akerl'
else
    user="$1"
fi

curl -s "https://github.com/$user" > ${user}.html

if [ ! -e index.html ] ; then
    ln -s ${user}.html index.html
fi

