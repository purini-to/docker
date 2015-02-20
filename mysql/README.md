Docker: MySQL コンテナ(永続化)
==================================
Dockerで使用するMySQLのコンテナです。  
永続化対応済み!

## 使い方
クローンしたディレクトリで以下のコマンドを入力
```
$ chmod 777 -rf data
$ docker build -t urainkyo/mysql .
$ docker run -i -d -v /{hogehoge}/data/mysql:/var/lib/mysql -p 3306:3306 -t urainkyo/mysql
```
`{hogehoge}`はクローンしたディレクトリまでのパスです。  
初回マウント時は`data/mysql`が空なので初期化処理が実行されます。  
初期化後は、`mysql -u admin -p admin`で接続することが出来ます。  
MySQLのデータは`data/mysql`内に永続化されているのでコンテナを再起動しても、以前の状態を保持します。
