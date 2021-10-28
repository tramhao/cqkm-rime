#!/bin/sh

set -e

echo "更多帮助详见：https://liangbi.gitee.io"

TS=$(date +%Y%m%d-%H%M%S)

DN=$HOME/.config/fcitx/rime
DM=$HOME/.config/ibus/rime
DK=$HOME/.local/share/fcitx5/rime

DR=/usr/share/rime-data

find tongyong -type d | xargs chmod 755
find tongyong -type f | xargs chmod 644

if [ -d $DR ];
then
  sudo cp -rf tongyong/* $DR
else
  echo "未检测到 Rime，请先安装 Rime 输入法引擎。程序退出。"
  exit
fi

for d in $DN $DM $DK; do
  [ -d "$d" ] && {
    echo "Backup $d to $d-$TS ..."
    mv "$d" "$d"-"$TS"
  }
  mkdir -m 755 -p $(dirname "$d")
  cp -a tongyong "$d"
done

echo "中州韻配置文件安装成功，注銷或重启系統後即可使用了。"
