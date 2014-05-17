#!/usr/bin/env bash

cd $(dirname "${BASH_SOURCE[0]}")/src

function download () {
    asset="$1"
    clean_name="$(echo "$asset" | sed -r 's/([a-z0-9]*)-[a-f0-9]*.([a-z]*)/\1.\2/')"
    echo "Downloading $asset"
    curl -s "https://assets-cdn.github.com/assets/$asset" > assets/$asset
}

curl -s "https://assets-cdn.github.com/images/spinners/octocat-spinner-128.gif" > images/spinners/octocat-spinner-128.gif

for path in $(curl -s "https://github.com/akerl" | grep -e '\.js' -e '\.css' | sed -r 's/.*(github|github2|frameworks)-([a-f0-9]*)\.(css|js).*/\1-\2.\3/') ; do
    download $path
done

for font in svg ttf woff; do
    path=$(grep 'octicons' assets/github.css | sed -r "s/.*(octicons)-([a-f0-9]*)\.($font).*/\1-\2.\3/")
    download $path
done

