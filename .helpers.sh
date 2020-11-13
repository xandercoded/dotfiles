#!/usr/bin/env bash

source ~/extras/helpers.sh
source ~/forgit.plugin.sh

fzf_process_kill() {
  kill -9 $(ps aux | fzf | awk '{print $2}')
}

net_check_http_secure_upgrade() {
  local r=$(curl --head -sLI "$1" | grep 'HTTP/\d\.\d|Location')

  if echo "$r" | grep -Eq "301" && echo "$r" | grep -Eq 'Location:\s+https:\/\/'; then
    echo redirected
    return 0
  else
    echo failed
    return 1
  fi
}

net_ip_in_cidr() {
  local ip=$1
  local cidr=$2

  if nmap -sL -n "$cidr" | awk '/Nmap scan report/{print $NF}' | grep -q "$ip\b"; then
    echo found
    return 0
  else
    echo "not found"
    return 1
  fi
}
