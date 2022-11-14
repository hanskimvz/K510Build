import os, time
import paramiko

server = "192.168.1.209"
sshpw = "rootpass"

remote_dir = "/root/data"
local_dir = "/home/k510_buildroot/k510_crb_lp3_v1_2_defconfig/target/root/data"

ssh = paramiko.SSHClient()
ssh.set_missing_host_key_policy(paramiko.AutoAddPolicy)
ssh.connect(server, port=22, username='root', password=sshpw)

rs = list()
xr = list()
stdin, stdout, stderr = ssh.exec_command("ls -lR %s" %(remote_dir))
out = stdout.readlines()
for block in out:
    lines = block.splitlines()
    for line in lines:
        if not line.strip():
            continue
        if line.startswith("total"):
            continue
        if line.startswith(remote_dir):
            path = line[:-1]
            continue
        if line.startswith("drwx"):
            continue

        if path.startswith("/root/data/coredump"):
            continue
        fname = line.split(" ")[-1]

        xr.append("%s/%s" %(path, fname))
        # print ("%s/%s" %(path, line.split(" ")[-1]))


sftp = ssh.open_sftp()
for x in xr:
    
    if (x.startswith(remote_dir+"/html/js")):
        continue
    if (x.startswith(remote_dir+"/html/images")):
        continue
    if (x.startswith(remote_dir+"/html/css")):
        continue
    local_file =  x.replace(remote_dir, local_dir)
    print(x,"=>",local_file )
    sftp.get(x, local_file)

# if out:
#     xr.extend(out[0].split(' '))
    
#     # ctime = 0
#     mtime = 0
#     # atime = 0
#     fsize = 0

#     if len(xr) >5:
#         strtime  = " ".join(xr[6:8])
#         mtime = int(time.mktime(time.strptime(strtime, "%Y-%m-%d %H:%M")))
#         timegap = int(f['mtime']) -int(mtime)
#         fsize = int(xr[5])
#         fsizegap = int(f['fsize']) - int(fsize)

#     rs.append({"fname": xr[0], "r_mtime": f['mtime'], "l_mtime": mtime, 'timegap':timegap, 'time-iso': strtime, "r_fsize": f['fsize'], "l_fsize":fsize, "fsizegap":fsizegap, "rpath": f['rpath']})


# sftp = ssh.open_sftp()
# print ("  ", end=" ")
# print ("%-20s" %('fname'), end=" ")
# print ("%12s" %('r_mtime'), end=" ")
# print ("%12s" %('l_mtime'), end=" ")
# print ("%10s" %('timegap'), end=" ")
# print ("%12s" %('r_fsize'), end=" ")
# print ("%12s" %('l_fsize'), end=" ")
# print ("%10s" %('fsizegap'), end=" ")
# print ("%s"   %('rpath'), end=" ")    

# print ()

# for r in rs:
#     flag = 'v' if (r['fsizegap'] != 0 or r['timegap'] > 60) else ""
#     if not (r['fname'].startswith('imx219_') and os.path.isfile(local_dir + r['fname'])):
#         flag = 'v'

#     r_file = "%s/%s"   %(r['rpath'], r['fname'])
#     print ("%-2s" %(flag), end=" ")
#     print ("%-20s" %r['fname'], end=" ")
#     print ("%12d" %r['r_mtime'], end=" ")
#     print ("%12d" %r['l_mtime'], end=" ")
#     print ("%10d" %r['timegap'], end=" ")
#     print ("%12d" %r['r_fsize'], end=" ")
#     print ("%12d" %r['l_fsize'], end=" ")
#     print ("%10d" %r['fsizegap'], end=" ")
#     print ("%s"   %(r_file), end=" ")

#     if flag == 'v':
#         local_file = local_dir + r['fname']
#         print ( "=> %s" %(local_file), end="")
#         print ("..", end="")
#         try:
#             x = sftp.get(r_file, local_file)
#         except Exception as e:
#             print (".......Fail")
#             print ("                          " +str(e))
        
#         else:
#             print ("..done", end="")

print ()

# for rfile in remoteFiles:
#     fname = rfile.split("/")[-1]
#     if not fname :
#         print ("Filename error")
#         continue
#     local_file = local_dir + fname
#     print (rfile, "=>", local_file)
#     info = sftp.stat(rfile)

#     print ("downloading file %s ==> %s: %s" %(rfile, local_file, info))
#     sftp.get(rfile, local_file)

# print ("done")

sftp.close()
ssh.close()