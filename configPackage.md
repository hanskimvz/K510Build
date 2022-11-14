
# Packages 
-- using menuconfig

make CONF=k510_crb_lp3_v1_2_defconfig menuconfig


Target packages > Networking applications:
    avahi, IPv4LL network address configuration daemon, mDNS/DNS-SD daemon, ethtool, enable pretty printing, iperf, netsnmp, Install BIB files on target and enable MIB loading code, nginx, ntp, ntpdate, openssh, tcpdump, smb dump support, wpa_supplicant, Enable nl80211 support, Enable AP mode, Emable Wi-Fi Display, Enable mesh networking, Enable autoscan, Enable EAP, Enable HS20, Enable syslog support, Install wpa_cli binary, Install wpa_client shared library, Enable wpa_passphrase binary, Enable support for the DBus contro interface, 

php-fpm:
    Target packages > Interpreter languages and scripting > php -> FPM interface
        ->Extension: Session, zlib, openssl, Sqlite3, PDO>Sqlite3,  JSON, curl, FTP, SNMP, socket, Posix, shmop
        -> 


python3:
    Target packages > Interpreter languages and scripting > python3
        > External python package: python-asnlcrypto, python-bcrypt, python-cffi, python-cryptography, prython-dataproperty, python-datautil, python-engineio, python-idna, python-ifaddr, python-mbstrdecoder, python-netaddr, python-netifaces, python-numpy,  python-praramiko, python-pip,python-psutil,python-pyasn1, python-pycparcer, python-pycryptodomex, python-pynacl, python-pyopenssl,   python-serial, python-serial-asyncio, python-setuptools, python-simplejson, python-simplesqlite, python-six,python-socketio, pthon-sqliteschema, python-sqlparse, python-tabledata, python-typepy, python-websocket-client, python-websockets,   python-zeroconf,

nginx:
    Target packages > Networking applications > nginx 

sshd:
    Target packages > Networking applications > openssh

ethtool:
    Target packages > Networking applications >ethtool

u-boot tools
    Target packages > Hardware handling > u-boot tools

gupnp:
    Target packages > Libraries > Networking > gupnp, gssdp, gupnp-av, gupnp-dlna



make CONF=k510_crb_lp3_v1_2_defconfig savedefconfig



complie & bulid:
make CONF=k510_crb_lp3_v1_2_defconfig


