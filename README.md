
## DL 
download files:
dl.tar.gz
    wget -c  https://github.com/kendryte/k510_buildroot/releases/download/v1.6/dl.tar.gz  -O pkg-download/dl.tar.gz;

ai_kmodel_data.tar.xz
    wget -c https://github.com/kendryte/k510_buildroot/releases/download/v1.7/ai_kmodel_data.tar.xz  -O dl/ai/ai_kmodel_data.tar.xz

nncaseruntime-k510-v1.7.1.tgz
wget -c https://github.com/kendryte/nncase/releases/download/v1.7.1/nncaseruntime-k510-v1.7.1.tgz /dl/nncase_linux_runtime/nncaseruntime-k510-v1.7.1.tgz


hdmi 빼기:
k510_buildroot/board/canaan/k510/genimage-emmc.cfg

image bootfs.vfat {
	vfat {
		files = {
			"bootm-bbl.img",
			"k510.dtb",
			"k510-hdmi.dtb",
			"uboot-emmc.env",
		}
	}
	size = 30M
}

image sysimage-emmc.img {
	hdimage {
	}

	partition u-boot {
		partition-type = 0xC
		image = "u-boot_burn.bin"
		offset = 0x100000
		size = 1M
	}

	partition boot {
		partition-type = 0xC
		bootable = "true"
		image = "bootfs.vfat"
	}

	partition rootfs {
		partition-type = 0x83
		image = "rootfs.ext2"
	}
}

menuconfig:

nginx :
Targe

php-fpm:
    Target packages > Interpreter languages and scripting > php -> FPM interface

python3:
    Target packages > Interpreter languages and scripting > python3

nginx:
    Target packages > Networking applications > nginx 

sshd:
    Target packages > Networking applications > openssh

u-boot tools
    Target packages > Hardware handling > u-boot tools

