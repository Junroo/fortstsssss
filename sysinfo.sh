#!/bin/bash
#color customization (because I want it to look nice~)
separator="$(tput setaf 3; tput bold)"
title="$(tput setaf 5; tput bold)"
clear="$(tput sgr0)"
exec &> sysinfo.log
echo "                          ${title}Operation System Information"
echo "${separator}*******************************************************************************"
echo "${title}OS name:${clear} $(uname -o)"
echo "${title}Kernel name:${clear} $(uname -s)"
echo "${title}Kernel release:${clear} $(uname -r)"
echo "${title}Kernel version:${clear} $(uname -v)"
echo "${title}Architecture:${clear} $(uname -m)"
echo "${title}Manufacturer:${clear} $(cat /sys/class/dmi/id/chassis_vendor)"
echo "${title}Product:${clear} $(cat /sys/class/dmi/id/product_name)"
echo "${title}Product version:${clear} $(cat /sys/class/dmi/id/product_version)"
echo "\n"
echo "                          ${title}Host information"
echo "${separator}*******************************************************************************"
echo "${title}Hostname:${clear} $(uname -n)"
echo "${title}IP-adress:${clear} $(hostname -i)"
echo "${title}DNS:${clear} $(hostname -d)"
echo "DNS services in use:${clear} $(systemd-resolve --status)"
echo "                          ${title}Network information"
echo "${separator}*******************************************************************************"
echo "${title}IP information:${clear} $(ip -4 address show)"
echo "${title}Port statistics:${clear} $(netstat -s)"
echo "${title}Kernel IP routing table:${clear} $(netstat -r)"
echo "${title}Kernel Interface table:${clear} $(netstat -i)"

