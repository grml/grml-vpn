#!/bin/sh

TMP_=${1:-test2}

function writeIPs
{
  local own_ip_="$1"
  local ip_=''
  local ip2_=''
  local cnt_='1000'
  local tmp_=''

  cat "$TMP_" |while read ip_; do
    cat "$TMP_" |while read ip2_; do
      if [[ "$ip_" == "$ip2_" ]]; then
        let cnt_=$cnt_+1
        continue
      fi
      echo "$cnt_ - ""$ip_" "$ip2_"
      let cnt_=$cnt_+1
    done
  done
}

for i in 192.168.9.20 192.168.9.10 192.168.9.1; do
  echo
  echo $i
  writeIPs $i |grep -E "($i )|($i$)"
done
