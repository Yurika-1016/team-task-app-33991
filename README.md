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

# アプリケーション名
チームタスク管理アプリ

# アプリケーション概要
チームのタスク管理ができるツールです。
<br>チームのタスクの一覧を管理できることはもちろん、
<br>メンバーのタスク負荷状況・勤務時間・その日の帰宅時間の確認や、
<br>チャットもすることができます。

# URL
https://team-task-app-33991.herokuapp.com/

# テスト用アカウント
メールアドレス：t@t
<br>パスワード：ttt111
<br>Basic認証 ユーザー名：admin
<br>Basic認証 パスワード：2222

# 利用方法
- 投稿したいユーザーは新規登録をしてください。
- ユーザー登録をし、ログインすれば本アプリ内機能を利用できます。
- トップページ：タスク一覧ページ、チームメスケジュールページ、チャットページに遷移できます。<br>新規タスク登録やマイページはヘッダーから遷移できます。
- タスク一覧ページ：登録されたタスク一覧を見ることができます。今日やるタスク順・登録日順等、並び替えもすることができます。
- チームスケジュールページ：チームメンバーの今日の帰宅時間や労働時間、今日のタスクを見ることができます。
- チャットページ：チームメンバーでチャットをすることができます。
- マイページ：カレンダー上に表示させた自分のスケジュールを見ることができます。また労働時間や帰宅時間登録をすることができます。


# 目指した問題解決
チームでのタスク管理をしていく中で下記の問題点を挙げられる。
- 日々の業務で発生するタスクについて、チームメンバーで共有ができない
- チームメンバーの労働時間や帰宅時間をチームメンバーで共有できない
- メンバーごとのタスク負荷状況を確認し、チーム内でタスクを分散したい
- メールより気軽なコミュニケーションツールを導入し、気軽に相談できるようにしたい

<br>上記の問題点を解決できることを目指した。

# 洗い出した要件 
- ユーザー管理機能
- 新規タスク登録機能
- トップページ
- タスク一覧表示機能
- チームメンバースケジュール一覧機能
- チャット機能
- マイスケジュール確認機能
- 今日の帰宅時間登録機能
- 労働時間登録機能

# 実装した機能についてのGIFと説明

## タスク一覧ページの説明
![demo](https://gyazo.com/8eb034828f67fb014ca1cc94fba2128b/raw)
タスクを一覧表示できます
</br>検索機能・並び替え機能を使用できます。

## メンバースケジュールページの説明
![demo](https://gyazo.com/d13e62cdc617cd81762968adc42c5dac/raw)
チームメンバーの今日のスケジュールを表示できます
</br>今日の帰宅時間や今月の労働時間累計、今日行うタスクを表示できます。

## チャットページの説明
![demo](https://gyazo.com/a7ddbded36a03e7934ff81e258796849/raw)
チャットページです。

## マイページの説明
![demo](https://gyazo.com/e53ea8120317641e069ec5eb942763bd/raw)
スケジュール上に自分の担当のタスクを表示できます。
<br>今日の帰宅時間の登録や労働時間も登録できます。

# データベース設計
![demo](https://gyazo.com/b991eb4d3aca96e5c770c925b0e7bb6a/raw)

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
- has_many :comments

## Tasksテーブル
|           column           |      type       |                            option                                |
| -------------------------- | --------------- | ---------------------------------------------------------------- |
|           name             |     string      |                           null:false                             |
|       time_required_id     |     integer     |              null:false, numericality: { other_than: 0 }         |
|       start_time           |     date        |                           null:false                             |
|       dead_line_date       |     datetime    |                           null:false                             |
|       operator_id          |     integer     |              null:false, numericality: { other_than: 0 }         |
|          user_id           |    references   |                  null:false, foreign_keys: true                  |
### Association
- belongs_to :user

## Schedulesテーブル
|           column           |      type       |                            option                                |
| -------------------------- | --------------- | ---------------------------------------------------------------- |
|         start_time         |     datetime    |           null:false, uniqueness: { scope: :user }               |
|       time_limit_id        |     integer     |                           null:false                             |
|          user_id           |    references   |                  null:false, foreign_keys: true                  |
### Association
- belongs_to :user

## Totalsテーブル
|           column           |      type       |                            option                                |
| -------------------------- | --------------- | ---------------------------------------------------------------- |
|         start_time         |     datetime    |          null:false, uniqueness: { scope: :user }                |
|      working_hour          |     integer     |          null:false, numericality: { only_integer: true }        |
|          user_id           |    references   |                  null:false, foreign_keys: true                  |
### Association
- belongs_to :user


## Commentsテーブル
|           column           |      type       |                            option                                |
| -------------------------- | --------------- | ---------------------------------------------------------------- |
|           text             |      text       |                           null:false                             |
|          user_id           |    references   |                  null:false, foreign_keys: true                  |
### Association
- belongs_to :user