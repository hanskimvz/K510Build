# backup files.

if [ ! -f target/etc/nginx/nginx.conf.org ]; then
    mv target/etc/nginx/nginx.conf target/etc/nginx/nginx.conf.org
fi

if [ ! -f target/etc/php-fpm.conf.org ]; then
    mv target/etc/php-fpm.conf target/etc/php-fpm.conf.org
fi

if [ ! -f target/etc/ssh/sshd_config.org ]; then
    mv target/etc/ssh/sshd_config target/etc/sshd_config.org
fi

if [ ! -f target/etc/init.d/rc.sysinit.org ]; then
    mv target/etc/init.d/rc.sysinit target/etc/init.d/rc.sysinit.org
    chmod 644 target/etc/init.d/rc.sysinit.org
fi

# if [ ! -d target/nais ]; then
#     mkdir target/nais
#     chmod 755 target/nais
# fi

if [ ! -d target/userfs ]; then
    mkdir target/userfs
    chmod 755 target/userfs
fi


cp _confFiles/nginx.conf target/etc/nginx/
cp _confFiles/php-fpm.conf target/etc/
cp _confFiles/sshd_config target/etc/ssh/

cp _confFiles/rc.sysinit target/etc/init.d/rc.sysinit
chmod 755 target/etc/init.d/rc.sysinit


cp _confFiles/getTemp.sh target/home/
chmod 755 target/home/getTemp.sh

cp _confFiles/netif.sh target/home/
chmod 755 target/home/netif.sh

cp _confFiles/demo_object_detect.sh target/home/
chmod 755 target/home/demo_object_detect.sh

cp _confFiles/demo_rtsp.sh target/home/
chmod 755 target/home/demo_rtsp.sh

