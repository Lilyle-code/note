#!/bin/bash

# 打包data并备份数据

# 变量
PACKAGE_NAME="data"
DATETIME=`date "+%Y-%m-%d %H:%M:%S"`
TARGET_BRANCH="master"

# 检测git空间状态
if [[ -n $(git status --s)  ]];then
  # 打包
  rm -f $PACKAGE_NAME.zip
  zip -r $PACKAGE_NAME.zip $PACKAGE_NAME

  # 提交推送
  if [ $? -eq 0 ]; then
    git add .
    git commit -m "$DATETIME"
    git pull
    git push --set-upstream origin $TARGET_BRANCH
  fi
else
  echo "workspce no changes"
fi
