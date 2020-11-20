#!/usr/bin/env bash

source ~/extras/helpers.sh
source ~/forgit.plugin.sh

fzf_process_kill() {
  kill -9 $(ps aux | fzf | awk '{print $2}')
}

net_check_http_secure_upgrade() {
  local r=$(curl --head -ksLI "$1" | grep -E 'HTTP/\d\.\d|Location')

  echo "$r" | grep -Eq "301" && echo "$r" | grep -Eq 'Location:\s+https:\/\/'
}

net_ip_in_cidr() {
  local ip=$1
  local cidr=$2

  nmap -sL -n "$cidr" | awk '/Nmap scan report/{print $NF}' | grep -q "$ip\b"
}
