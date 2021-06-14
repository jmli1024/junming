#! /bin/bash
#  Description: install gitlab on centos7

# 定义gitlab域名
DNS_NAME="gitlab.changyuan.com"

# 安装gitlab
yum -y install policycoreutils openssh-server openssh-clients postfix
wget https://mirrors.tuna.tsinghua.edu.cn/gitlab-ce/yum/el7/gitlab-ce-13.10.4-ce.0.el7.x86_64.rpm
yum -y install gitlab-ce-13.10.4-ce.0.el7.x86_64.rpm

# 修改gitlab配置文件
cp /etc/gitlab/gitlab.rb{,.ori}
sed -i "/^external_url/ s/gitlab.example.com/${DNS_NAME}/g" /etc/gitlab/gitlab.rb

# 重启服务
clear; echo "配置gitlab文件，并重启gitlab服务"
sleep 1
gitlab-ctl reconfigure
gitlab-ctl restart

# 配置登陆用户和邮箱地址
git config --global user.name  ${USER_NAME}
git config --global user.email ${USER_EMAIL}
