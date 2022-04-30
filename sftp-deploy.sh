#!/bin/bash
UserName=" "
# Your remote server username
# 你的服务器用户名
RemoteHost=" "
# Your remote host domain or ip address
# 你的服务器域名或者ip地址
Port="22"
# The port of your server ssh
# 你的服务器ssh端口
KeyPath=""
# The key of your server ssh
# 你的服务器密钥
RemotePath=""
# The remote folder path to upload to server, recommend use absolute path
# 需要上传到的服务器文件夹路径
LocalPath=""
# Path of the local folder to be uploaded
# 本地需要上传的文件夹路径

# !!! important 
# about the behavior in the script, be sure to use after reading
# rm $RemotePath/* 
# delete all files in the RemotePath
# 删除远程文件夹中的所有文件
# put -r $LocalPath/* $RemotePath
# upload all of files in the local folder
# 将本地文件夹中的所有文件上传

###
# run some command before upload, like:
# hugo 
# hexo g 
###
sftp -i $KeyPath $UserName@$RemoteHost <<EOF
rm $RemotePath/*
put -r $LocalPath/* $RemotePath
exit
EOF
echo "upload finish"