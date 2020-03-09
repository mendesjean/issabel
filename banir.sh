#!/bin/bash
# 
iptables -F
echo Permitindo IP 201.62.64.3 
iptables -A INPUT -s 201.62.64.3 -p tcp -j ACCEPT
iptables -A INPUT -s 201.62.64.3 -p udp -j ACCEPT

echo Permitindo IP 201.62.64.211
iptables -A INPUT -s 201.62.64.211 -p tcp -j ACCEPT
iptables -A INPUT -s 201.62.64.211 -p udp -j ACCEPT

echo Bloqueando qualquer requisição na porta 6022
iptables -A INPUT -p tcp --dport 6022 -j DROP
iptables -A INPUT -p udp --dport 6022 -j DROP


echo Bloqueando lista de IPs perigosos

wget -O - https://raw.githubusercontent.com/DaniloEvalt/IPs-para-bloqueio/master/ip.sh | bash
