#! /usr/bin/env bash

lynx -source https://wallhaven.cc/random > wallhaven-src
sed 's/a class="preview" href="/\'$'\n/g' wallhaven-src |
    sed '/^</d' |
      sed 's/"  target="_blank".*src="" ><//g' |
        sed 's/"  .*//' > random-wp

cat random-wp
