「実践Rub on Rails 4」写経
==========================

### 参考

* [『実践Ruby on Rails 4』読者サポートページ - Ruby on Rails with OIAX](http://www.oiax.jp/jissen_rails)


### 動かし方

* ホストOSで `vagrant up` し、ゲストOSを立ち上げる
* `vagrant ssh` でゲストOSにつなぐ
* `bin/rails s` でRailsアプリを動かすサーバを起動
* ホストOSのブラウザから http://localhost:4000/ で見れる
* ホスト名：Macの場合、 `/private/etc/hosts` をいじって、
  http://example.com:4000 , http://baukis.example.com:4000 などでもアクセスできるようにする。
