# MSYS2 setting

## packageインストール
```
pacman -Syu
# restart msys2
pacman -Syu # 再度実行
pacman -S git # vimも一緒に入る
pacman -S winpty # tty実行のため
```

## 設定
* Windowsのユーザー環境変数に`MSYS2_PATH_TYPE=inherit`を設定

## dotfileコピー
```
./setup
```
