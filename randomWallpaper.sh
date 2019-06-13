#! /usr/bin/env bash

lynx -source https://wallhaven.cc/random |
  sed 's/a class="preview" href="/\n/g' |
    sed '/^</d' |
      sed 's/"  target="_blank".*src="" ><//g' |
        sed 's/"  .*//' | cat
echo "\n"
