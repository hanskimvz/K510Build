
import os, time, sys


while True:
    print (time.strftime('%Y.%m.%d - %H:%M:%S'))
    with open ("/proc/meminfo", "r") as f:
        body = f.read()
    
    print (body)
    with open ("/proc/net/netstat", "r") as f:
        body = f.read()

    lines = body.splitlines()
    print (len(lines))

    tabs1 = lines[0].split(" ")
    tabs2 = lines[1].split(" ")
    for i in range(len(tabs1)):
        print (tabs1[i], ":", tabs2[i])

    print ()
    tabs1 = lines[2].split(" ")
    tabs2 = lines[3].split(" ")
    for i in range(len(tabs1)):
        print (tabs1[i], ":", tabs2[i])


    with open ("/sys/class/thermal/thermal_zone0/temp", "r") as f:
        body = f.read()
    print ("temperature:", body)
    
    time.sleep(1)