
# 词典
mv  ~/.local/share/fcitx5/pinyin/dictionaries/ ~/.config/LeiDotFile/fcitx5/dictionaries
ln -s  ~/.config/LeiDotFile/fcitx5/dictionaries  ~/.local/share/fcitx5/pinyin/dictionaries

mkdir -p ~/.config/LeiDotFile/PrivateFile/fcitx5
# 个人仓库
mv  ~/.local/share/fcitx5/pinyin/user.dict  ~/.config/LeiDotFile/PrivateFile/fcitx5/
mv  ~/.local/share/fcitx5/pinyin/user.history  ~/.config/LeiDotFile/PrivateFile/fcitx5/

ln -s ~/.config/LeiDotFile/PrivateFile/fcitx5/user.dict ~/.local/share/fcitx5/pinyin/user.dict
ln -s ~/.config/LeiDotFile/PrivateFile/fcitx5/user.history ~/.local/share/fcitx5/pinyin/user.history

# 配置文件

mv  ~/.config/fcitx5/conf ~/.config/LeiDotFile/fcitx5/conf
ln -s ~/.config/LeiDotFile/fcitx5/conf ~/.config/fcitx5/conf

# 说明

echo "fcitx5配置文件和通用字典，用户字典放到PrivateFile"> ~/.config/LeiDotFile/fcitx5/README.md