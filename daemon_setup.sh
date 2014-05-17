#!/usr/bin/env bash

cd $(dirname "${BASH_SOURCE[0]}")

pacman -Syu --needed --noconfirm nginx

unchanged_sha="8afcd712bc47ee098a3d06f7e388a3d9d28f07de  /etc/nginx/nginx.conf"
if [ "$(shasum /etc/nginx/nginx.conf)" != "$unchanged_sha" ] ; then
    echo "Nginx config has been modified; bailing"
    exit 1
fi

cp nginx.conf /etc/nginx/nginx.conf
sed -i "s|FAKEHUB_ROOT|$(pwd)/src|" /etc/nginx/nginx.conf
systemctl restart nginx

