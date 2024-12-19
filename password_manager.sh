#!/bin/bash

####### 課題  ステップ２ #######

function get_password() {
    inq_svc="$1"  # 関数の引数をローカル変数に代入
    if grep -q -w "$inq_svc" kanri.csv; then
      # kanri.csvファイル中にinqがあれば、2列目と3列目を取り出す
      user=$(grep -w "$inq_svc" kanri.csv | cut -d',' -f2)
      password=$(grep -w "$inq_svc" kanri.csv | cut -d',' -f3)

      echo "サービス名：" $inq_svc
      echo "ユーザ名  ：" $user
      echo "パスワード：" $password
    else
    # kanri.csvファイル中にinqに相当するものが無い
      echo "そのサービスは登録されていません。"
    fi
}

echo "パスワードマネージャーへようこそ！"
while :
do
read -p "次の選択肢から入力してください(Add Password/Get Password/Exit)：" req
    case $req in
    "Add Password")
        read -p "サービス名を入力してください：" svc
        read -p "ユーザー名を入力してください：" user
        read -p "パスワードを入力してください：" paswd
        # 入力が完了したら管理ファイル(csv)に追記保管
        echo $svc,$user,$paswd >> kanri.csv
        echo "パスワードの追加は成功しました。"
        echo \
        
        ;;
    "Get Password")
        read -p "サービス名を入力して下さい：" inq_svc
        # 入力した文字列に合致するサービス名を探索する関数を呼ぶ
        get_password "$inq_svc"
        echo \
        ;;
    "Exit")
        # Exitが入力されたらプログラムを終了
        echo 'Thank you!'; break
        ;;
    *)
        echo '入力が間違えています。'
        ;;   
    esac
done
