#!/usr/bin/env bash
mkdir /etc/rsyncd
touch /etc/rsyncd/rsyncd.conf          #主配置文件
touch /etc/rsyncd/rsyncd.secrets       #用户名密码文件，一组用户一行，用户名和密码使用 : 分割
touch /etc/rsyncd/rsyncd.motd          #非必须，连接上rsyncd显示的欢迎信息，此文件可不创建
chmod 600 /etc/rsyncd/rsyncd.secrets  #必须注意的是，rsyncd服务的密码文件权限必须是600 否则可能rsync不能工作

echo "test:testuser" >> /etc/rsyncd/rsyncd.secrets
cat ./rsync.conf >> /etc/rsyncd/rsyncd.conf
rsync --daemon --config=/etc/rsyncd/rsyncd.conf # 开启rsync服务
#################### 客户端 ######################
#rsync -avzP test@104.224.134.235::test ~/test/ #同步服务器目录到 ~/test/
#rsync -avzP ~/test/ test@104.224.134.235::test #将本地目录推送到服务器目录
