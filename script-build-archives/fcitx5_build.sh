
# 词典
mv  ~/.local/share/fcitx5/pinyin/dictionaries/ ~/.config/LeiDotFile/fcitx5/dictionaries
ln -s  ~/.config/LeiDotFile/fcitx5/dictionaries  ~/.local/share/fcitx5/pinyin/dictionaries

mkdir -p ~/.config/LeiPrivateFile/fcitx5
# 个人仓库
mv  ~/.local/share/fcitx5/pinyin/user.dict  ~/.config/LeiPrivateFile/fcitx5/
mv  ~/.local/share/fcitx5/pinyin/user.history  ~/.config/LeiPrivateFile/fcitx5/

ln -s ~/.config/LeiPrivateFile/fcitx5/user.dict ~/.local/share/fcitx5/pinyin/user.dict
ln -s ~/.config/LeiPrivateFile/fcitx5/user.history ~/.local/share/fcitx5/pinyin/user.history

# 配置文件

mv  ~/.config/fcitx5/conf ~/.config/LeiDotFile/fcitx5/conf
ln -s ~/.config/LeiDotFile/fcitx5/conf ~/.config/fcitx5/conf

# 说明

echo "fcitx5配置文件和通用字典，用户字典放到PrivateFile"> ~/.config/LeiDotFile/fcitx5/README.md