#!/bin/bash

####### 課題　ステップ１ #######
echo "パスワードマネージャーへようこそ！"
read -p "サービス名を入力してください：" svc
read -p "ユーザー名を入力してください：" user
read -p "パスワードを入力してください：" paswd

# キー入力をtxtファイルに保管(追記式)
echo $svc,$user,$paswd >> kanri.txt


# 入力が完了したら
echo "Thank you!"
