#!/bin/bash

SYSTEMVERSION=`cat /etc/issue | tr -s '\n'|awk '{print $1}'|sed -n '1p'`
if [ $SYSTEMVERSION = "Debian" ]
then
	sed -i 's/httpredir.debian.org/mirrors.aliyun.com/g' /etc/apt/sources.list
elif [ $SYSTEMVERSION = "Ubuntu" ]
then
	sed -i "s/archive.ubuntu.com/mirrors.aliyun.com/g" /etc/apt/sources.list

elif [ $SYSTEMVERSION = "CentOS" ]

then
	sed  -i 's/mirrorlist/#mirrorlist/'  /etc/yum.repos.d/CentOS-Base.repo
	sed  -i 's/#baseurl/baseurl/'  /etc/yum.repos.d/CentOS-Base.repo
	sed  -i 's/mirror.centos.org/mirrors.aliyun.com/'  /etc/yum.repos.d/CentOS-Base.repo
fi
