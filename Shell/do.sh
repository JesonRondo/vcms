#!/bin/sh

SQL_FILE=/data/app/vcms/vcms.sql
WWW_ROOT=/data/app/vcms/Public/vicbeta

CMS_ROOT=/data/app/vcms
DEP_ROOT=/data/app/jesonrondo.github.com

echo "[$(date +%Y-%m-%d\ %H:%M:%S)] start"

###
mysqldump -uroot -ppazzword zombie > $SQL_FILE
echo "--- db bak ---"

###
cd $WWW_ROOT
jekyll build
echo "--- build jekyll ---"
cd $CMS_ROOT
git pull
git status -s|awk '{print $2}'|xargs git add
git commit -m "cms shell update"
git push -u origin master
echo "--- cms push ---"

###
rm -fr $DEP_ROOT/*
cp -f -r $WWW_ROOT/_site/* $DEP_ROOT
cd $DEP_ROOT
git pull
git commit -a -m "cms shell update"
git push -u origin master
echo "--- cp finish ---"
