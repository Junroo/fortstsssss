#!/bin/bash

#selinux installation if not installed
yum -y install policycoreutils selinux-policy-targeted policycoreutils-python

#setroubleshoot installation
#here we get the lins from a file centosLinks
wget -i centosLinks.txt && yum localinstall *.rpm

#SELinux activation in enforcing mode and troubleshooting
sed -i 's/GRUB_CMDLINE_LINUX_DEFAULT=\"console=tty0 console=ttyS0,115200n8 /GRUB_CMDLINE_LINUX_DEFAULT=\"console=ttyS0,115200n8 console=tty0 selinux=1 security=selinux enforcing=1 /g' /etc/default/grub
rm -f /etc/sysconfig/selinux
ln -s /etc/selinux/config /etc/sysconfig/selinux
sed -i 's/SELINUX=disabled/SELINUX=enforcing/g' /etc/selinux/config
touch /.autorelabel
grub2-mkconfig -o /etc/grub2.cfg
reboot

