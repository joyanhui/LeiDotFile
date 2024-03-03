# dotFile

- zsh 自定义
- neovim Nvchad + elulcao + 自定义
- kitty vytorrennan + 自定义
- fonts 字体ttf文件
# 镜像
gitea [https://gitee.com/joyanhui/LeiDotFile](https://gitee.com/joyanhui/LeiDotFile)    
github [https://github.com/joyanhui/LeiDotFile](https://github.com/joyanhui/LeiDotFile)
# 安装步骤
可以按需安装 步骤： 在一个临时目录按需pull,然后单独处理对应的dot file。   
需要 `git --version`>=2.5 `bash/sh/zsh` 后面的脚本不完全兼容fish
## 临时目录
```bash
mkdir -p ~/tmp_LeiDotFile
cat > ~/tmp_LeiDotFile/bash.sh << \EOF
mkdir - ~/.config/LeiDotFile/PrivateFile/
mkdir - ~/.config/LeiPrivateFile/
rm -rf ~/tmp_LeiDotFile/cache
mkdir -p ~/tmp_LeiDotFile/cache && cd ~/tmp_LeiDotFile/cache
git init
git remote add origin https://gitee.com/joyanhui/LeiDotFile.git
git config core.sparsecheckout true
EOF
```
## zsh 安装步骤
```bash
bash ~/tmp_LeiDotFile/bash.sh
cd ~/tmp_LeiDotFile/cache
echo "ZshLight" >  .git/info/sparse-checkout
git pull origin main:
# 复制到.config 并ln对应文件

mv  ~/.zshrc ~/.zshrc_bak
mv ~/.zsh_history ~/.config/LeiPrivateFile/zsh_history
mv ~/.bash_history ~/.config/LeiPrivateFile/bash_history
mv ~/.bashrc ~/.config/LeiPrivateFile/bashrc
```