
# Packages 
-- using menuconfig

make CONF=k510_crb_lp3_v1_2_defconfig menuconfig


Target packages > Networking applications:
    avahi, IPv4LL network address configuration daemon, mDNS/DNS-SD daemon, ethtool, enable pretty printing, iperf, netsnmp, Install BIB files on target and enable MIB loading code, nginx, ntp, ntpdate, openssh, tcpdump, smb dump support, wpa_supplicant, Enable nl80211 support, Enable AP mode, Emable Wi-Fi Display, Enable mesh networking, Enable autoscan, Enable EAP, Enable HS20, Enable syslog support, Install wpa_cli binary, Install wpa_client shared library, Enable wpa_passphrase binary, Enable support for the DBus contro interface, 

php-fpm:
    Target packages > Interpreter languages and scripting > php -> FPM interface
        ->Extension: Session, zlib, openssl, Sqlite3, JSON, curl, FTP, SNMP, socket, Posix, shmop

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




req.count 22
alloc_memory > phy_addr 0x1c044000, size 3112960
alloc_memory > phy_addr 0x1bd4b000, size 3112960
alloc_memory > phy_addr 0x1ba52000, size 3112960
alloc_memory > phy_addr 0x1b759000, size 3112960
alloc_memory > phy_addr 0x1b460000, size 3112960
alloc_memory > phy_addr 0x1b167000, size 3112960
alloc_memory > phy_addr 0x1ae6e000, size 3112960
alloc_memory > phy_addr 0x1ab75000, size 3112960
alloc_memory > phy_addr 0x1a87c000, size 3112960
alloc_memory > phy_addr 0x1a583000, size 3112960
alloc_memory > phy_addr 0x1a28a000, size 3112960
alloc_memory > phy_addr 0x19f91000, size 3112960
alloc_memory > phy_addr 0x19c98000, size 3112960
alloc_memory > phy_addr 0x1999f000, size 3112960
alloc_memory > phy_addr 0x196a6000, size 3112960
alloc_memory > phy_addr 0x193ad000, size 3112960
alloc_memory > phy_addr 0x190b4000, size 3112960
alloc_memory > phy_addr 0x18dbb000, size 3112960
alloc_memory > phy_addr 0x18ac2000, size 3112960
alloc_memory > phy_addr 0x187c9000, size 3112960
alloc_memory > phy_addr 0x184d0000, size 3112960
alloc_memory > phy_addr 0x181d7000, size 3112960
v4l2_output>channel: 0
req.count 22
alloc_memory > phy_addr 0x1818b000, size 307200
alloc_memory > phy_addr 0x1813f000, size 307200
alloc_memory > phy_addr 0x180f3000, size 307200
alloc_memory > phy_addr 0x180a7000, size 307200
alloc_memory > phy_addr 0x1805b000, size 307200
alloc_memory > phy_addr 0x1800f000, size 307200
alloc_memory > phy_addr 0x17fc3000, size 307200
alloc_memory > phy_addr 0x17f77000, size 307200
alloc_memory > phy_addr 0x17f2b000, size 307200
alloc_memory > phy_addr 0x17edf000, size 307200
alloc_memory > phy_addr 0x17e93000, size 307200
alloc_memory > phy_addr 0x17e47000, size 307200
alloc_memory > phy_addr 0x17dfb000, size 307200
alloc_memory > phy_addr 0x17daf000, size 307200
alloc_memory > phy_addr 0x17d63000, size 307200
alloc_memory > phy_addr 0x17d17000, size 307200
alloc_memory > phy_addr 0x17ccb000, size 307200
alloc_memory > phy_addr 0x17c7f000, size 307200
alloc_memory > phy_addr 0x17c33000, size 307200
alloc_memory > phy_addr 0x17be7000, size 307200
alloc_memory > phy_addr 0x17b9b000, size 307200
alloc_memory > phy_addr 0x17b4f000, size 307200
v4l2_output>channel: 1
encode_ch>channel: 0
encode_ch>channel: 1

  Encoding 0,  picture #1      - size  169647, totalsize     169647,  input_phy_addr 0x1bd4b000
  Encoding 0,  picture #2      - size      90, totalsize     169737,  input_phy_addr 0x1bd4b000
  Encoding 0,  picture #3      - size   56914, totalsize     226651,  input_phy_addr 0x1ba52000
  Encoding 0,  picture #4      - size   43218, totalsize     269869,  input_phy_addr 0x1b759000
  Encoding 0,  picture #5      - size   14099, totalsize     283968,  input_phy_addr 0x1b460000
  Encoding 0,  picture #6      - size   11982, totalsize     295950,  input_phy_addr 0x1b167000
  Encoding 0,  picture #7      - size   10639, totalsize     306589,  input_phy_addr 0x1ae6e000
  Encoding 0,  picture #8      - size   10249, totalsize     316838,  input_phy_addr 0x1ab75000
  Encoding 0,  picture #9      - size   10371, totalsize     327209,  input_phy_addr 0x1a87c000
  Encoding 0,  picture #10     - size   10051, totalsize     337260,  input_phy_addr 0x1a583000
  Encoding 0,  picture #11     - size   10434, totalsize     347694,  input_phy_addr 0x1a28a000
  Encoding 0,  picture #12     - size   10803, totalsize     358497,  input_phy_addr 0x19f91000
  Encoding 0,  picture #13     - size   10633, totalsize     369130,  input_phy_addr 0x19c98000
  Encoding 0,  picture #14     - size   10741, totalsize     379871,  input_phy_addr 0x1999f000
  Encoding 0,  picture #15     - size   10482, totalsize     390353,  input_phy_addr 0x196a6000
  Encoding 0,  picture #16     - size    9534, totalsize     399887,  input_phy_addr 0x193ad000
  Encoding 0,  picture #17     - size   10036, totalsize     409923,  input_phy_addr 0x190b4000
  Encoding 0,  picture #18     - size   10710, totalsize     420633,  input_phy_addr 0x18dbb000
  Encoding 0,  picture #19     - size    9664, totalsize     430297,  input_phy_addr 0x18ac2000
  Encoding 0,  picture #20     - size    9925, totalsize     440222,  input_phy_addr 0x187c9000
  Encoding 1,  picture #1      - size   28163, totalsize      28163,  input_phy_addr 0x1805b000
  Encoding 0,  picture #21     - size   10884, totalsize     451106,  input_phy_addr 0x184d0000
  Encoding 0,  picture #22     - size   10837, totalsize     461943,  input_phy_addr 0x181d7000
  Encoding 0,  picture #23     - size   11621, totalsize     473564,  input_phy_addr 0x1c044000
  Encoding 0,  picture #24     - size   11731, totalsize     485295,  input_phy_addr 0x1bd4b000
  Encoding 0,  picture #25     - size   10215, totalsize     495510,  input_phy_addr 0x1ba52000
  Encoding 0,  picture #26     - size   76998, totalsize     572508,  input_phy_addr 0x1b759000
  Encoding 1,  picture #2      - size    2321, totalsize      30484,  input_phy_addr 0x17e93000
  Encoding 0,  picture #27     - size   13679, totalsize     586187,  input_phy_addr 0x1b460000
  Encoding 0,  picture #28     - size   12811, totalsize     598998,  input_phy_addr 0x1b167000
  Encoding 0,  picture #29     - size   13183, totalsize     612181,  input_phy_addr 0x1ae6e000
  Encoding 0,  picture #30     - size   12091, totalsize     624272,  input_phy_addr 0x1ab75000
  Encoding 0,  picture #31     - size   11113, totalsize     635385,  input_phy_addr 0x1a87c000
  Encoding 0,  picture #32     - size   11268, totalsize     646653,  input_phy_addr 0x1a583000
  Encoding 1,  picture #3      - size    2247, totalsize      32731,  input_phy_addr 0x17ccb000
  Encoding 0,  picture #33     - size   11266, totalsize     657919,  input_phy_addr 0x1a28a000
  Encoding 0,  picture #34     - size   11669, totalsize     669588,  input_phy_addr 0x19f91000

