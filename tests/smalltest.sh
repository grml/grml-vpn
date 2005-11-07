#!/bin/sh

# test all 3 input methodes for vpn with 2 computers
echo 'MIT USER PW'
echo 'input = stdin'
cat test1 |fakeroot ./grml-vpn -k testpw -p -c -a 192.168.9.10 add 1000
echo 'input = file'
fakeroot ./grml-vpn -k testpw -p -f test1 -a 192.168.9.10 add 1000
echo 'input = cmd'
fakeroot ./grml-vpn -k testpw -p -a 192.168.9.10 add 1000 192.168.9.10 192.168.9.20
echo "input = cmd SPECIAL CASE, without -a"
fakeroot ./grml-vpn -k testpw -p add 1000 192.168.9.10 192.168.9.20

echo
echo 'MIT AUTO PW'
echo 'input = stdin'
cat test1 |fakeroot ./grml-vpn -p -c -a 192.168.9.10 add 1000
echo 'input = file'
fakeroot ./grml-vpn -p -f test1 -a 192.168.9.10 add 1000
echo 'input = cmd'
fakeroot ./grml-vpn -p -a 192.168.9.10 add 1000 192.168.9.10 192.168.9.20
