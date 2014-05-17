#!/usr/bin/env bash

cd $(dirname "${BASH_SOURCE[0]}")/src

if [[ -z "$1" ]] ; then
    user='akerl'
else
    user="$1"
fi

function download () {
    asset="$1"
    if [ -e assets/$path ] ; then
        echo "Resource already retrieved: $path"
    else
        echo "Downloading $asset"
        curl -s "https://assets-cdn.github.com/assets/$asset" > assets/$asset.tmp
        if [ "${asset##*.}" == "js" ] ; then
            js-beautify -o assets/$asset assets/${asset}.tmp
        else
            mv assets/$asset.tmp assets/$asset
        fi
    fi
}

for path in $(curl -s "https://github.com/$user" | grep -e '\.js' -e '\.css' | sed -r 's/.*(github|github2|frameworks)-([a-f0-9]*)\.(css|js).*/\1-\2.\3/') ; do
    download $path
done

for font in svg ttf woff; do
    for path in $(grep 'octicons' assets/github-*.css | sed -r "s/.*(octicons)-([a-f0-9]*)\.($font).*/\1-\2.\3/") ; do
        download $path
    done
done

