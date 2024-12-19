# アプレンティスWebテスト
## 提出QUEST「パスワードマネージャー」をシェルスクリプトで作成する

- [x] **【ステップ１】**<br>
　パスワードを保存する処理をシェルスクリプトで作成した。

　　  - シェルスクリプト： password_store.sh <br>
　　  - 保存ファイル名　： kanri.txt <br>
<br>
- [x] **【ステップ２】**<br>
　前記のステップ１の機能に加えて、保存したパスワードを検索する機能を付与したシェルクリプトを作成した。

　　  - シェルスクリプト： password_manager.sh <br>
　　  - 保存ファイル名　： kanri.csv <br>
<br>
- [ ] **【ステップ３】**<br>
　前記のステップ２の機能に加えて、保存したパスワードのファイルを暗号化する機能を付与したシェルクリプトを作成した。

　　  - シェルスクリプト： password_manager_enc.sh <br>
　　  - 保存ファイル名　： kanri_enc.csv.gpg <br>

> [!CAUTION]
> 入力した情報がこれで良いかの確認をして、OKなら保存ファイルに情報を残すというようには成っていません。

> [!CAUTION]
> 作成したパスワードマネージャ（シェルスクリプト）には、パスワードを更新したり、あるいは当該レコードを削除したりする機能を備えていません。
> 現時点では、変更・削除の場合は、保存ファイル kanri.txt／kanri.csv をエディタで直接操作するしかありません。


