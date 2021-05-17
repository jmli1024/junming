#! /bin/bash

echo "正在登录Linux主机：192.168.66.137……"

set timeout 300
/usr/bin/expect -c "
    spawn ssh root@192.168.66.137
    expect {
	\"*(yes/no)\" { send \"yes\r\"; exp_continue }
	\"*password\" { send \"123123\r\"; exp_continue }
    }

interact"
