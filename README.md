# かごメシ

`「かごメシ」`というサービスは、

`「鹿児島ならではの美味しいディナー情報」`を知りたい

`「鹿児島へ出張するペパボのパートナー」` 向けの、

`「鹿児島ディナー情報サイト」`です。

ユーザーは `「ペパボのパートナーが実際に行った鹿児島のディナー情報を入手して、感想を投稿すること」` ができ、

`「食べログ」`とは違って、

`「鹿児島オフィスチームのおすすめするお店だけが載っていて、実際にそのお店に行ったペパボのパートナーのリアルな感想を見ることができる。」`のが特徴です。


## 開発
Dockerを使用して開発環境を立ち上げます。

### 初回起動時

```bash
$ docker-compose build
$ docker-compose run web bundle exec rake db:migrate

# 初期データが必要な場合のみ
$ docker-compose run web bundle exec rake db:seed

$ docker-compose up -d
```

### 2回目以降の起動

```
$ docker-compose up -d
```

### 終了時

```bash
$ docker-compose stop
```
