#!/bin/bash
theme="$(tput setaf 3)"
exec > >(tee -i audit.log)
exec 2>&1
echo -e "\n"
echo "${theme}╰(°ㅂ°)╯ ╰(°ㅂ°)╯ WELCOME TO YOUR WORKSTATION AUDITOR ╰(°ㅂ°)╯ ╰(°ㅂ°)╯╰(°ㅂ°)╯"
echo -e "\n"
echo "Uptime: $(uptime | awk '{print $3, $4}' | tr -d ',')"
echo -e "\n"
echo -e "Current users:\n $(who -H)\n"
echo -e "Recent logins:\n $(last)\n"
echo -e "Memory usage:\n $(free -m)\n"
used=$(free | awk '/Mem/{print $3}')
free=$(free | awk '/Mem/{print $4}')
if ((used > free))
then echo "Hey, time to clean up your storage ∠( ᐛ 」∠)＿"
else echo "fine, you have enough space (^・ω・^)"
fi
echo -e "\n"
echo -e "Top 10 processes by memory usage:\n $(ps aux | sort -nr -k 4 | head -10)\n"
echo -e "Open TCP and UDP ports:\n $(netstat -ltu)\n"
swap_total=$(free | awk '/Swap/{print $2}')
swap_used=$(free | awk '/Swap/{print $3}')
echo "Virtual memory usage:"$((swap_used/swap_total*100)) "%"
echo -e "\n"
echo -e "Disk space usage: \n $(df -i -h)\n"
echo "╰(°ㅂ°)╯ ╰(°ㅂ°)╯ ╰(°ㅂ°)╯ ╰(°ㅂ°)╯ ╰(°ㅂ°)╯ ╰(°ㅂ°)╯ ╰(°ㅂ°)╯ ╰(°ㅂ°)╯╰(°ㅂ°)╯ "

