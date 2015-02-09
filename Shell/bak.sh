#!/bin/sh

SQL_FILE=/data/app/vcms/vcms.sql
CMS_ROOT=/data/app/vcms

echo "[$(date +%Y-%m-%d\ %H:%M:%S)] starting shell"

###
echo "[$(date +%Y-%m-%d\ %H:%M:%S)] bakup database start"
mysqldump -uroot -ppazzword zombie > $SQL_FILE
echo "[$(date +%Y-%m-%d\ %H:%M:%S)] bakup database finish"

###
cd $CMS_ROOT
echo "[$(date +%Y-%m-%d\ %H:%M:%S)] vcms push start"
git pull
git status -s|awk '{print $2}'|xargs git add
git commit -a -m "cms shell update"
git push -u origin master
echo "[$(date +%Y-%m-%d\ %H:%M:%S)] vcms push finish"

