# wget https://s3.amazonaws.com/spec.ccfc.min/img/hello/fsfiles/hello-rootfs.ext4
# wget https://cloud.centos.org/centos/7/images/CentOS-7-x86_64-GenericCloud-1905.qcow2.xz

# virt-customize -a CentOS-7-x86_64-GenericCloud-1905.qcow2 --root-password password:1 --uninstall cloud-init --uninstall gssproxy --uninstall selinux-policy-targeted --uninstall selinux-policy

# yum install xterm

qemu-system-x86_64 -enable-kvm -nographic -serial mon:stdio -smp 4 -m 32000 -drive file=hello-rootfs.ext4,if=virtio -kernel bzImage -append 'root=/dev/vda console=ttyS0,115200'
