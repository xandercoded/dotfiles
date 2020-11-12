#!/usr/bin/env bash

source ~/extras/helpers.sh

http_check_secure_upgrade() {
  r=$(curl --head -sLI "$1" | grep 'HTTP/\d\.\d|Location')
  if echo "$r" | grep -Eq "301" && echo "$r" | grep -Eq 'Location:\s+https:\/\/'; then
    echo redirected
    return 0
  else
    echo failed
    return 1
  fi
}

fzf_process_kill() {
  kill -9 $(ps aux | fzf | awk '{print $2}')
}
