mkdir -p  ~/Downloads/tmp && cd  ~/Downloads/tmp
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v3.1.1/JetBrainsMono.zip
unzip JetBrainsMono.zip


mkdir -p ~/.config/LeiDotFile/fonts/JetBrainsMonoNerd
mv ./*.ttf ~/.config/LeiDotFile/fonts/JetBrainsMonoNerd

sudo ln -s  ~/.config/LeiDotFile/fonts /usr/share/fonts/LeiDotFile_fonts


fc-cache -f
