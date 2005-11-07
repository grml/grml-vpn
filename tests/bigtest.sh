#!/bin/sh

# test all 3 input methodes for vpn with 2 computers
echo 'MIT USER PW'
echo 'input = stdin'
cat test2 |fakeroot ./grml-vpn -k testpw -p -c -a 192.168.9.10 add 1000
echo 'input = file'
fakeroot ./grml-vpn -k testpw -p -f test2 -a 192.168.9.10 add 1000
echo 'input = cmd'
fakeroot ./grml-vpn -k testpw -p -a 192.168.9.10 add 1000 192.168.9.10 192.168.9.20 192.168.9.1

echo
echo 'MIT AUTO PW'
echo 'input = stdin'
cat test2 |fakeroot ./grml-vpn -p -c -a 192.168.9.10 add 1000
echo 'input = file'
fakeroot ./grml-vpn -p -f test2 -a 192.168.9.10 add 1000
echo 'input = cmd'
fakeroot ./grml-vpn -p -a 192.168.9.10 add 1000 192.168.9.10 192.168.9.20 192.168.9.1
