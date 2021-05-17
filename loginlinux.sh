#! /bin/bash
#  Date: 2020-5-16
#  Descriptions: 手动登录某台服务器，执行脚本即可自动登录，不需要输入密码的操作
#  适合在Mac笔记本上面

echo "正在登录Linux主机：192.168.66.137……"

set timeout 300
/usr/bin/expect -c "
    spawn ssh root@192.168.66.137
    expect {
	\"*(yes/no)\" { send \"yes\r\"; exp_continue }
	\"*password\" { send \"123123\r\"; exp_continue }
    }

interact"
