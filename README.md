# dotFile

- zsh 自定义
- neovim Nvchad + elulcao + 自定义
- kitty vytorrennan + 自定义
- fonts 字体ttf文件
# 镜像
Gitee [[延迟更新]](https://gitee.com/joyanhui/LeiDotFile)    
GitHub [[最新版本]](https://github.com/joyanhui/LeiDotFile)
# 安装步骤
可以按需安装 步骤： 在一个临时目录按需pull,然后单独处理对应的dot file。   
需要 `git --version`>=2.5 `bash/sh/zsh` 后面的脚本不完全兼容fish
## 按需安装
### 临时目录
<details>
<summary> bash</summary>

```bash
mkdir -p ~/tmp_LeiDotFile
cat > ~/tmp_LeiDotFile/bash.sh << \EOF
#!/bin/bash
#export GitUrl=https://gitee.com/joyanhui/LeiDotFile.git
export GitUrl=https://mirror.ghproxy.com/https://github.com/joyanhui/LeiDotFile

mkdir -p ~/.config/LeiDotFile/
mkdir -p ~/.config/LeiPrivateFile/
rm -rf ~/tmp_LeiDotFile/cache
mkdir -p ~/tmp_LeiDotFile/cache && cd ~/tmp_LeiDotFile/cache
git init
git remote add origin ${GitUrl}
git config core.sparsecheckout true
EOF
```
</details>

### 字体安装步骤
zsh和nvim需要里面的JetBrainsMonoNerd字体，不然比较难看
<details>
<summary> bash</summary>

```bash
bash ~/tmp_LeiDotFile/bash.sh
cd ~/tmp_LeiDotFile/cache
echo "fonts" >  .git/info/sparse-checkout
git pull origin main:
# 复制到 ~/.config/LeiDotFile/
cp -r ./fonts ~/.config/LeiDotFile/fonts
# 需要sudo权限 软连接到/usr/local/share/fonts
sudo ln -s ~/.config/LeiDotFile/fonts /usr/share/fonts/LeiDotFile_fonts
fc-cache -f
```
</details> 

### zsh 安装步骤
<details>
<summary> bash</summary>

```bash
bash ~/tmp_LeiDotFile/bash.sh
cd ~/tmp_LeiDotFile/cache
echo "ZshLight" >  .git/info/sparse-checkout
git pull origin main:
# 备份以及 复制到.config 并ln对应文件
# 复制到 ~/.config/LeiDotFile/
cp -r ./ZshLight ~/.config/LeiDotFile/ZshLight
# 备份原来的zshrc
mv  ~/.zshrc ~/.zshrc_bak
# 移动到 ~/.config/LeiPrivateFile/ 单独管理 这步非必需
mv ~/.zsh_history ~/.config/LeiPrivateFile/zsh_history
mv ~/.bash_history ~/.config/LeiPrivateFile/bash_history
mv ~/.bashrc ~/.config/LeiPrivateFile/bashrc
ln -s ~/.config/LeiPrivateFile/bash_history  ~/.bash_history
ln -s ~/.config/LeiPrivateFile/bashrc  ~/.bashrc
ln -s ~/.config/LeiDotFile/ZshLight/zshrc  ~/.zshrc

```
</details>

### kitty 安装步骤
<details>
<summary> bash</summary>

```bash
bash ~/tmp_LeiDotFile/bash.sh
cd ~/tmp_LeiDotFile/cache
echo "kitty" >  .git/info/sparse-checkout
git pull origin main:
# 备份以及 复制到.config 并ln对应文件
# 复制到 ~/.config/LeiDotFile/
cp -r ./kitty ~/.config/LeiDotFile/kitty
# 备份原来kitty
mv ~/.config/kitty ~/.config/kitty_bak
ln -s ~/.config/LeiDotFile/kitty ~/.config/kitty
```
</details>

### neovim 安装步骤
<details>
<summary> bash 安装最新版neovim >0.8.5</summary>

```bash

sudo apt install ripgrep # 可选 
wget -c https://github.com/neovim/neovim/releases/download/nightly/nvim.appimage -O ~/user_opt/nvim.appimage
chmod +x  ~/user_opt/nvim.appimage
# 在zshrc 或者 bashrc 中添加 一行 alias nvim='~/user_opt/nvim.appimage'
# 清理旧的配置文件和缓存
rm -rf ~/.cache/nvim ~/.local/share/nvim/ ~/.config/nvim  ~/.config/nvim-NvChad-custom
rm -rf ~/.config/LeiDotFile/nvim/NvChad ~/.config/LeiDotFile/nvim/NvChad-custom
```
</details>

<details>
<summary> bash 获取基于NvChad的配置文件</summary>

```bash
bash ~/tmp_LeiDotFile/bash.sh
cd ~/tmp_LeiDotFile/cache
echo "nvim" >  .git/info/sparse-checkout
git pull origin main:
# 复制到 ~/.config/LeiDotFile/
cp -r ./nvim ~/.config/LeiDotFile/nvim

ln -s ~/.config/LeiDotFile/nvim/NvChad ~/.config/nvim
ln -s  ~/.config/LeiDotFile/nvim/NvChad-custom ~/.config/nvim/lua/custom
# 科学环境手动运行一次 nvim 因为需要安装插件依赖 或者 直接拉取
nvim
```
</details>
