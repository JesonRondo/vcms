#!/bin/sh

SQL_FILE=/data/app/vcms/vcms.sql
WWW_ROOT=/data/app/vcms/Public/vicbeta

CMS_ROOT=/data/app/vcms
DEP_ROOT=/data/app/jesonrondo.github.com

echo "[$(date +%Y-%m-%d\ %H:%M:%S)] starting shell"

###
echo "[$(date +%Y-%m-%d\ %H:%M:%S)] bakup database start"
mysqldump -uroot -ppazzword zombie > $SQL_FILE
echo "[$(date +%Y-%m-%d\ %H:%M:%S)] bakup database finish"

###
cd $WWW_ROOT
echo "[$(date +%Y-%m-%d\ %H:%M:%S)] build jekyll start"
jekyll build
echo "[$(date +%Y-%m-%d\ %H:%M:%S)] build jekyll finish"
cd $CMS_ROOT
echo "[$(date +%Y-%m-%d\ %H:%M:%S)] vcms push start"
git pull
git status -s|awk '{print $2}'|xargs git add
git commit -m "cms shell update"
git push -u origin master
echo "[$(date +%Y-%m-%d\ %H:%M:%S)] vcms push finish"

###
echo "[$(date +%Y-%m-%d\ %H:%M:%S)] cp bolg start"
rm -fr $DEP_ROOT/*
cp -f -r $WWW_ROOT/_site/* $DEP_ROOT
echo "[$(date +%Y-%m-%d\ %H:%M:%S)] cp bolg finish"
cd $DEP_ROOT
echo "[$(date +%Y-%m-%d\ %H:%M:%S)] push bolg start"
git pull
git status -s|awk '{print $2}'|xargs git add
git commit -m "cms shell update"
git push -u origin master
echo "[$(date +%Y-%m-%d\ %H:%M:%S)] push bolg finish"
