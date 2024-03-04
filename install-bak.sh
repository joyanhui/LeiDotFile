#!/bin/sh

until [ "$input" = "1" ]; do
    echo "请先确定已经自行备份好自己的配置文件"
    echo "会直接移动备份原的文件到~/LeiDotFile_install_bak,并使用新的配置和文件"
    echo "包括但是可能不限于一下目录和文件"
    echo "～/.config/LeiDotFile"
    echo "～/.zshrc ～/.zsh_history  ～/.bashrc"
    echo "～/.config/nvim/ ~/.cache/nvim ~/.local/share/nvim ~/.config/nvim-NvChad-custom"
    echo "～/.config/terminator/"
    echo "～/.config/kitty/"
    echo "."
    echo "依赖 curl 和 unzip，请先安装"
    echo "输入1开始"
    read input
    if [ "$input" != "1" ]; then
        echo "脚本已终止"
        exit 1
    fi
done

echo "开始执行"
#echo "准备备份目录和git地址  ========= start"
if [ -z "$BackupDir" ]; then
  BackupDir=~/LeiDotFile_install_bak/$(date "+%Y%m%d-%H%M%S")
fi
if [ -z "$GitUrl" ]; then
    #GitUrl=https://gitee.com/joyanhui/LeiDotFile.git
    GitUrl=https://mirror.ghproxy.com/https://github.com/joyanhui/LeiDotFile.git
fi
#echo "准备备份目录和git地址  ========= end"

echo "你的文件会被备份到" "$BackupDir"
echo "使用git地址为" $GitUrl



# LeiDotFile
echo "备份原来LeiDotFile"
mv  ~/.config/LeiDotFile "$BackupDir"/LeiDotFile
# zsh and bash

# vim
mkdir -p "$BackupDir"/nvim/
mv  ~/.config/nvim/ "$BackupDir"/nvim/config
mv  ~/.cache/nvim "$BackupDir"/nvim/cache
mv  ~/.local/share/nvim "$BackupDir"/nvim/local_share
mv  ~/.config/nvim-NvChad-custom "$BackupDir"/nvim/nvim-NvChad-custom
# terminator
mv  ~/.config/terminator "$BackupDir"/terminator
# kitty
mv  ~/.config/kitty "$BackupDir"/kitty

# 下面是执行代码
# 将需要执行的命令放在这里
