# static                       
ifconfig eth0 192.168.1.209 netmask 255.255.0.0 broadcast 192.168.255.255
ifconfig lo 127.0.0.1 netmask 255.255.0.0 broadcast 127.0.255.255        
route add -net 127.0.0.0 netmask 255.255.0.0 lo                          
route add default gw 192.168.1.1 dev eth0 
echo "nameserver 114.114.114.114" > /etc/resolv.conf

# dhcp
# /sbin/ifup -a -f

# Add ipv4 & ipv6 addr to /etc/hosts
# name=" canaan"
# ipv4=`ifconfig eth0 |grep "inet addr:" | awk '{print $2}'| cut -c6-15`
# ipv6=`ifconfig eth0 |grep "inet6 addr:" | awk '{print $3}' | cut -c1-23`
# IPV4=$ipv4$name
# IPV6=$ipv6$name
# echo $IPV4 >> /etc/hosts
# echo $IPV6 >> /etc/hosts