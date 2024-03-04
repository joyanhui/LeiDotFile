#!/bin/sh
#echo "准备备份目录和git地址  ========= start"
if [ -z "$BackupDir" ]; then
  BackupDir=~/LeiDotFile_install_bak/$(date "+%Y%m%d-%H%M%S")
fi
if [ -z "$GitUrl" ]; then
    #GitUrl=https://gitee.com/joyanhui/LeiDotFile.git
    GitUrl=https://mirror.ghproxy.com/https://github.com/joyanhui/LeiDotFile.git
fi
if [ -z "$Git_tmp" ]; then
    Git_tmp=~/tmp_LeiDotFile
fi
#echo "准备备份目录和git地址  ========= end"


echo "默认安装到 ～/.config/LeiDotFile"
echo "就的配置文件会备份到 $BackupDir"
echo "使用git下载，地址为 $GitUrl"
echo ""
echo "请选择你要启用的功能"
echo "可选  fcitx5 fonts kitty nvim terminator zsh"
echo "全部 启用输入 all"
echo "请输入逗号分隔的字符串（例如：kitty,zsh）："
# shellcheck disable=SC2162
read input_string



# git On demand cloning
fun_do_git_clone_OnDemand_init() {
  echo "准备git On demand cloning 目录为 $Git_tmp/cache "
  rm -rf $Git_tmp/cache &&  mkdir -p $Git_tmp/cache && cd $Git_tmp/cache
  git init
  git remote add origin ${GitUrl}
  git config core.sparsecheckout true
}

# fcitx5    =============== start
fun_do_fcitx5_backup(){
  echo "备份原来fcitx5 如果文件不存在可能会报错，无关紧要"
  mkdir -p "$BackupDir"/fcitx5
  mv  ~/.config/fcitx5/conf  "$BackupDir"/fcitx5/conf
  mv  ~/.local/share/fcitx5/pinyin/dictionaries  "$BackupDir"/fcitx5/dictionaries
}
fun_do_fcitx5_ln(){
  echo "fcitx5 创建软连接"
  ln -s  ~/.config/LeiDotFile/fcitx5/dictionaries  ~/.local/share/fcitx5/pinyin/dictionaries
  ln -s ~/.config/LeiDotFile/fcitx5/conf ~/.config/fcitx5/conf
}
# fcitx5   =============== end

# zsh      =============== start
fun_do_zsh_backup() {
  echo "备份原来zsh和bash 如果文件不存在可能会报错，不影响"
  mkdir -p "$BackupDir"/zsh_bash
  # 检查 $BackupDir/zsh_bash/.zshrc 是否存在
  mv  ~/.zshrc  "$BackupDir"/zsh_bash/.zshrc
  mv  ~/.bashrc  "$BackupDir"/zsh_bash/.bashrc
}
fun_do_zsh_ln() {
  echo "zsh 创建软连接"
  ln -s ~/.config/LeiDotFile/ZshLight/zshrc  ~/.zshrc
  ln -s ~/.config/LeiDotFile/ZshLight/bashrc  ~/.bashrc
}
# zsh       =============== end
# fonts     =============== start
fun_do_fonts_backup() {
  echo "备份原来 LeiDotFile_fonts 如果文件不存在可能会报错，不影响"
  echo "需要sudo权限 操作 /usr/share/fonts/目录"
  sudo mv /usr/share/fonts/LeiDotFile_fonts "$BackupDir"/LeiDotFile_fonts
}
fun_do_fonts_ln(){
  echo "需要sudo权限 操作 /usr/share/fonts/目录"
  sudo ln -s  ~/.config/LeiDotFile/fonts /usr/share/fonts/LeiDotFile_fonts
  echo "正在更新字体缓存"
  fc-cache -f
}
# fonts     =============== end
# kitty    =============== start
fun_do_kitty_backup() {
  echo "备份原来kitty 如果文件不存在可能会报错，不影响"
  mv  ~/.config/kitty "$BackupDir"/kitty
}
fun_do_kitty_ln() {
  echo "kitty 创建软连接"
  ln -s ~/.config/LeiDotFile/kitty ~/.config/kitty
}
# kitty    =============== end
# nvim     =============== start
fun_do_nvim_backup() {
  echo "备份原来nvim 如果文件不存在可能会报错，不影响"
  mkdir -p "$BackupDir"/nvim/
  mv  ~/.config/nvim "$BackupDir"/nvim/config
  mv  ~/.cache/nvim "$BackupDir"/nvim/cache
  mv  ~/.local/share/nvim "$BackupDir"/nvim/local_share
}
fun_do_nvim_ln() {
  echo "nvim 创建软连接"
  ln -s ~/.config/LeiDotFile/nvim/NvChad ~/.config/nvim
  ln -s  ~/.config/LeiDotFile/nvim/NvChad-custom ~/.config/nvim/lua/custom
  echo "其他插件需要科学环境运行一次nvim后自动安装"
}
# nvim     =============== end
# terminator    =============== start
fun_do_terminator_backup() {
  echo "备份原来terminator 如果文件不存在可能会报错，不影响"
  mv  ~/.config/terminator "$BackupDir"/terminator
}
fun_do_terminator_ln() {
  echo "terminator 创建软连接"
  ln -s ~/.config/LeiDotFile/terminator ~/.config/terminator
}
# ================================================ 主功能开始 ================================================


# 如果输入的是all，那么直接克隆 执行
if [ "$input_string" = "all" ]; then
  fun_do_fcitx5_backup
  fun_do_fonts_backup
  fun_do_kitty_backup
  fun_do_nvim_backup
  fun_do_terminator_backup
  fun_do_zsh_backup
  rm -rf ~/.config/LeiDotFile
  git clone ${GitUrl} ~/.config/LeiDotFile
  fun_do_fcitx5_ln
  fun_do_fonts_ln
  fun_do_kitty_ln
  fun_do_nvim_ln
  fun_do_terminator_ln
  fun_do_zsh_ln
  echo "安装完成"
  exit 0
else
  fun_do_git_clone_OnDemand_init # 初始化
  input_array=$(echo "$input_string" | tr ',' ' ')
  # 备份 原来文件 以及处理 sparse-checkout
  for s in $input_array
  do
      case "$s" in
          fcitx5)
            fun_do_fcitx5_backup #备份 fcitx5
            echo "fcitx5" >>  .git/info/sparse-checkout
            ;;
          fonts)
            fun_do_fonts_backup
            echo "fonts" >>  .git/info/sparse-checkout
            ;;
          kitty)
              fun_do_kitty_backup
              echo "kitty" >>  .git/info/sparse-checkout
              ;;
          nvim)
              fun_do_nvim_backup
              echo "nvim" >>  .git/info/sparse-checkout
              ;;
          terminator)
              fun_do_terminator_backup
              echo "terminator" >>  .git/info/sparse-checkout
              ;;
          zsh)
              fun_do_zsh_backup #备份 zsh
              echo "ZshLight" >>  .git/info/sparse-checkout
              ;;
          *)
              # 默认情况（如果输入不是1、2或3）
              echo "无效选项：$s"
              ;;
      esac
  done

fi

# 将逗号替换为空格



