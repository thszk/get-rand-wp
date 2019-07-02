#! /usr/bin/env bash

# SFW content
SFW() {
    lynx -source https://wallhaven.cc/random |
      sed 's/a class="preview" href="/\n/g' |
        sed '/^</d' |
          sed 's/"  target="_blank".*src="" ><//g' |
            sed 's/"  .*//' > file
}

# NSFW content
NSFW(){
    lynx -source 'https://wallhaven.cc/search?purity=010&sorting=random' |
      sed 's/a class="preview" href="/\n/g' |
        sed '/^</d' |
          sed 's/"  target="_blank".*src="" ><//g' |
            sed 's/"  .*//' > file
}

# automatically open links
OPEN() {
    while read line; do
        firefox --new-tab "$line"
        sleep 0.5
    done < file
}

# main
case "$1" in
    -n) NSFW ;;
    *) SFW ;;
esac

# OPEN
cat file
echo ""
rm file
