

sudo apt install ripgrep #可选
wget -c https://github.com/neovim/neovim/releases/download/nightly/nvim.appimage -O ~/user_opt/nvim.appimage
chmod +x  ~/user_opt/nvim.appimage
# echo "alias nvim='~/user_opt/nvim.appimage'" >> ~/.zshrc #or ~/.bashrc 自己配置一下


## 字体参考 [JetBrainsMonoNerd_install](fonts_build.sh)


rm -rf ~/.cache/nvim ~/.local/share/nvim/ ~/.config/nvim  ~/.config/nvim-NvChad-custom
rm -rf ~/.config/LeiDotFile/nvim/NvChad ~/.config/LeiDotFile/nvim/NvChad-custom

git clone https://github.com/NvChad/NvChad  ~/.config/LeiDotFile/nvim/NvChad  --depth 1
ln -s ~/.config/LeiDotFile/nvim/NvChad ~/.config/nvim
rm -rf ~/.config/LeiDotFile/nvim/NvChad/.git*

rm -rf  ~/.config/LeiDotFile/nvim/NvChad/lua/custom
git clone https://github.com/joyanhui/nvim-NvChad-custom.git  ~/.config/LeiDotFile/nvim/NvChad-custom  --depth 1


ln -s  ~/.config/LeiDotFile/nvim/NvChad-custom ~/.config/nvim/lua/custom
rm -rf ~/.config/LeiDotFile/nvim/NvChad-custom/.git*
rm -rf ~/.config/LeiDotFile/nvim/NvChad-custom/.vscode

~/user_opt/nvim.appimage #启动自动加载其他插件