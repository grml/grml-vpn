#!/bin/ash

SPI_='1000'

# bash runs a while/for/until loop in a subshell if input/output is a pipe
# ksh also
function generateRules
{
  local cnt_="$SPI_"  # current value of spi
  local ip_=''
  local ip2_=''
  local tmp_=''

  cat "$TMP_" |while read ip_; do
    cat "$TMP_" |while read ip2_; do
      echo "$cnt_ $ip_ $ip2_"
      ((cnt_++))
    done
  done
}

TMP_=${1:-test2}

generateRules
