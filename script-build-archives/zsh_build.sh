
mkdir -p ~/.config/LeiDotFile/ZshLight/plugins # 插件目录
mkdir -p ~/.config/LeiPrivateFile # 私密文件


# rm -rf ~/.zshrc_bak
mv  ~/.zshrc ~/.zshrc_bak
mv ~/.zsh_history ~/.config/LeiPrivateFile/
mv ~/.zsh_history ~/.config/LeiPrivateFile/zsh_history
mv ~/.bash_history ~/.config/LeiPrivateFile/bash_history
mv ~/.bashrc ~/.config/LeiPrivateFile/bashrc


mkdir -p ~/.config/LeiDotFile/ZshLight/plugins && cd ~/.config/LeiDotFile/ZshLight/plugins
# china need
export GhProxy=https://mirror.ghproxy.com/ # or other
git clone ${GhProxy}https://github.com/zdharma-continuum/fast-syntax-highlighting.git
git clone ${GhProxy}https://github.com/zsh-users/zsh-autosuggestions.git
git clone ${GhProxy}https://github.com/zsh-users/zsh-completions.git

#touch ~/.config/LeiDotFile/ZshLight/zshrc
ln -s ~/.config/LeiDotFile/ZshLight/zshrc  ~/.zshrc
ln -s ~/.config/LeiPrivateFile/bash_history  ~/.bash_history
ln -s ~/.config/LeiPrivateFile/bashrc  ~/.bashrc


rm -rf ~/.config/LeiDotFile/ZshLight/plugins/zsh-autosuggestions/.git
rm -rf ~/.config/LeiDotFile/ZshLight/plugins/zsh-completions/.git
rm -rf ~/.config/LeiDotFile/ZshLight/plugins/fast-syntax-highlighting/.git