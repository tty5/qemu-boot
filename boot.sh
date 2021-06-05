#!/usr/bin/env bash
# win10
# guest install spice guest tool
qemu-system-x86_64 -enable-kvm -vnc :2  -smp 16 -m 32000 -vga qxl -usbdevice tablet -drive file=win10-disk.qcow2,if=virtio #-cdrom win10_1909_chinese_x64.iso -drive file=virtio-win-0.1.160.iso,index=0,media=cdrom -redir tcp:3389::3389

# wget https://s3.amazonaws.com/spec.ccfc.min/img/hello/fsfiles/hello-rootfs.ext4
# wget https://cloud.centos.org/centos/7/images/CentOS-7-x86_64-GenericCloud-1905.qcow2.xz

# dnf install -y libguestfs-tools-c
# apt install linux-image-5.4.0-33-generic libguestfs-tools -y
# virt-customize -a CentOS-7-x86_64-GenericCloud-1905.qcow2 --root-password password:1 --uninstall cloud-init --uninstall gssproxy --uninstall selinux-policy-targeted --uninstall selinux-policy

# yum install xterm

cu -l /dev/pts/0

/usr/libexec/qemu-kvm -enable-kvm -nographic -serial mon:tcp::4444,server,wait=off -smp 4 -m 8G -drive file=Fedora-Cloud-Base-32-1.6.x86_64.qcow2,if=virtio -s -nic user,hostfwd=tcp::52-:22 #-kernel bzImage -append 'root=/dev/vda console=ttyS0,115200 nokaslr debug'


/usr/libexec/qemu-kvm -enable-kvm -nographic -serial mon:tcp::4444,server,wait=off -device vhost-vsock-pci,id=vhost-vsock-pci0,guest-cid=3 -smp 4 -m 8G -drive file=Fedora-Cloud-Base-32-1.6.x86_64.qcow2,if=virtio -s -nic user,hostfwd=tcp::52-:22 #-kernel bzImage -append 'root=/dev/vda console=ttyS0,115200 nokaslr debug'

gdb vmlinux -ex 'target remote :1234'

KERN_CFLAGS="CFLAGS_base.o=-Og"

make clean; bear make bzImage -j200 $KERN_CFLAGS

make scripts_gdb

apropos lx



