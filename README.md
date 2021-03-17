# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

**以下実装後に再編集します**

# アプリケーション名
チームタスク管理アプリ

# アプリケーション概要
チームのタスク管理ができるツールです。
<br>チームのタスクの一覧を管理できることはもちろんのこと、
<br>メンバーのタスク負荷状況の確認や、チャットもすることができます。

# URL
https://team-task-app-33991.herokuapp.com/

# テスト用アカウント
メールアドレス：t@t
<br>パスワード：ttt111
<br>Basic認証 ユーザー名：admin
<br>Basic認証 パスワード：2222

# 利用方法
- 投稿したいユーザーは新規登録をしてください（閲覧のみであれば登録不要）。
- ユーザー登録をし、ログインすれば新規投稿やmy schedule機能を利用できます。
- トップページ：タスク一覧ページ、チームスケジュールページ、チャットページに遷移できます。<br>新規タスク登録やmy schedule登録はヘッダーから遷移できます。
- タスク一覧ページ：登録されたタスク一覧を見ることができます。並び替えもすることができます。
- チームスケジュールページ：チームメンバーのスケジュールや労働時間、今日のタスクを見ることができます。
- チャットページ：チームメンバーでチャットをすることができます。

# 目指した問題解決
チームでのタスク管理をしていく中で下記の問題点を挙げられる。
- 日々の業務で発生するタスクについて、チームメンバーで共有ができない（個人で抱えてしまう）
- チームメンバーの労働時間や帰宅時間をチームメンバーで共有できない
- メンバーごとのタスク負荷状況を確認し、チーム内でタスクを分散したい
- メールより気軽なコミュニケーションツールを導入し、気軽に相談できるようにしたい

<br>上記の問題点を解決できることを目指した。

# 洗い出した要件 
- ユーザー管理機能
- 新規タスク登録機能
- トップページ
- タスク覧表示機能
- チームメンバースケジュール一覧機能
- チャット機能
- マイスケジュール登録機能

<!-- # 実装した機能についてのGIFと説明
## トップページの説明
地図上の各都道府県のブロックをクリックすると各都道府県ごとのグルメ一覧ページに遷移できます。
</br>（地図の下部にひっそりと日本全国一覧ページも設けています）
</br>ワンクリックで視覚的に都道府県を選択できるようにしたのがこだわりの点です。

## 各都道府県別一覧ページの説明
![demo](https://gyazo.com/5816c21bfef48eb1c802596b8084f32f/raw)
各都道府県の一覧ページです
</br>クリックすると詳細ページに遷移します。

# 実装予定の機能
投稿者の性別ごとでの検索機能

# データベース設計
![demo](https://gyazo.com/8c5427e2ccf43e8154f671b14ba885fb/raw) -->

# ローカルでの動作方法
https://github.com/Yurika-1016/team-task-app-33991.git
<br>ruby version '2.6.5'
<br>Ruby on Rails

## Usersテーブル
|      column      |      type       |                 option                    |
| ---------------- | --------------- | ----------------------------------------- |
|    last_name     |     string      |               null:false                  |
|    first_name    |     string      |               null:false                  |
|    position      |     boolean     |                                           |
|      email       |     string      |               null:false                  |
|encrypted_password|     string      |               null:false                  |
### Association
- has_many :tasks
- has_many :schedules
- has_many :totals

## Tasksテーブル
|           column           |      type       |                            option                                |
| -------------------------- | --------------- | ---------------------------------------------------------------- |
|           name             |     string      |                           null:false                             |
|       time_required_id     |     integer     |              null:false, numericality: { other_than: 0 }         |
|   implementation_date      |     date        |                           null:false                             |
|       dead_line_date       |     datetime    |                           null:false                             |
|       operator_id          |     integer     |              null:false, numericality: { other_than: 0 }         |
|          user_id           |    references   |                  null:false, foreign_keys: true                  |
          |
### Association
- belongs_to :user

## Schedulesテーブル
|           column           |      type       |                            option                                |
| -------------------------- | --------------- | ---------------------------------------------------------------- |
|           date             |     datetime    |           null:false, uniqueness: { scope: :user }               |
|       time_limit_id        |     integer     |                           null:false                             |
|          user_id           |    references   |                  null:false, foreign_keys: true                  |
### Association
- belongs_to :user

## Totalsテーブル
|           column           |      type       |                            option                                |
| -------------------------- | --------------- | ---------------------------------------------------------------- |
|           date             |     datetime    |          null:false, uniqueness: { scope: :user }                |
|      working_hour          |     integer     |          null:false, numericality: { only_integer: true }                |
|          user_id           |    references   |                  null:false, foreign_keys: true                  |
### Association
- belongs_to :user
