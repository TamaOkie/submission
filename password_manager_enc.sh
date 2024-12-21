#!/bin/bash

####### 課題  ステップ３ #######
## パスワードが保存されたファイルを暗号化する。(セキュリティ確保の為)

# パスワードマネージャの初回使用時は暗号化保存ファイル(空き)を作成
if [ -f "list.enc" ]; then
  :     # 保存ファイルが存在する場合はif文を抜ける
else
  touch list.csv           # 空の一時保存ファイルを作成
  zip -e list.enc list.csv # 空の暗号化保存ファイルを作成
  rm list.csv              # 空の一時保存ファイルを削除
fi

# パスワードを検索する関数
function get_password() {
    inq_svc="$1"  # 関数の引数をローカル変数に代入
    if grep -q -w "$inq_svc" list.csv; then
      # list.csvファイル中にinqがあれば、2列目と3列目を取り出す
      user=$(grep -w "$inq_svc" list.csv | cut -d',' -f2)
      password=$(grep -w "$inq_svc" list.csv | cut -d',' -f3)

      echo "サービス名：" $inq_svc
      echo "ユーザ名  ：" $user
      echo "パスワード：" $password
    else
    # list.csvファイル中にinqに該当するものが無い
      echo "そのサービスは登録されていません。"
    fi
}

# メインプログラム
echo "パスワードマネージャーへようこそ！"
while :
do
read -p "次の選択肢から入力してください(Add Password/Get Password/Exit)：" req
    case $req in
    "Add Password")
        read -p "サービス名を入力してください：" svc
        read -p "ユーザー名を入力してください：" user
        read -p "パスワードを入力してください：" paswd

        # 保存ファイルを復号
        unzip list.enc  # --> list.csvを復元
        
        # 保存の原ファイルに追記
        echo $svc,$user,$paswd >> list.csv

        # 暗号化し、その後、一時ファイルを削除
        zip -e list.enc list.csv  # --> .encファイル生成
        rm list.csv
        
        # 結果の表示
        echo "パスワードの追加に成功しました。(暗号化して保存)"
        echo \
        ;;
    "Get Password")
        read -p "サービス名を入力して下さい：" inq_svc

        # 保存ファイルを復号
        unzip list.enc  # --> list.csvを復元

        # 入力した文字列に合致するサービス名を探索する関数を呼ぶ
        get_password "$inq_svc"
        echo \

        # 一時ファイルを削除
        rm list.csv
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
