# README

# アプリケーション名
GoalF

# アプリケーションの概要
ゴルフレッスンを受ける時間がない人やネットの情報がありふれすぎてどれが最適化わからない人にみんなが何を参考にしているかを共有できる掲示板

# URL
https://goalf.herokuapp.com/

# テスト用アカウント
## Basic認証
ユーザー名：golf
パスワード：goalf
## ユーザー情報
メールアドレス：admin@user
パスワード：admin1

# 利用方法
1. 新規投稿から必要な情報を入力して記事を投稿する
2. トップページの記事を選択して、詳細画面へ移行する
3. 投稿した記事にいいねをする。もしくはコメントを打つ
4. トップページのログイン名を押すとマイページへ移行する
5. マイページにお気に入り、投稿記事が閲覧できる（未実装）
6. マイページにてゴルファーとしての情報が登録、編集できる

# アプリケーションを作成した背景
私の趣味がゴルフなのですが、レッスンに通えるほどお金と時間に余裕があるわけではなく、そういった方々は世の中にいっぱいいると思ったことと、今の時代にインターネットにゴルフレッスンの情報はありふれてますが、記事や動画で言っていることが違ったり、人それぞれと書かれていることが多くて、どれを参考にしていいかわからないので、それを全国のアマチュアゴルファー感でどんな身長、体重、特徴の人がどの記事を参考にして、どれくらい役に立ったかが分かれば、それに基づいて練習することによりより上達の近道になるのではと考えたためです。

# 洗い出した要件

# 実装した機能について

# 実装予定機能
・サブスクリプト化かもしくは記事に対しての投げ銭化ができるといいと考えています。

# データベース設計
goalf.dioに記載

# 画面遷移図

# 開発環境
フロントエンド
バックエンド
タスク管理

# 工夫したポイント

## users テーブル

| Column             | Type    | Options                  |
| ------------------ | ------- | ------------------------ |
| nickname           | string  | null: false              |
| email              | string  | null: false, unique: true|
| encrypted_password | string  | null: false              |
| sex_id             | integer | null: false              |
| age                | integer | null: false              |
| height             | integer | null: false              |
| weight             | integer | null: false              |


### Association

- has_many :articles
- has_many :comment
- has_many :favor
- has_one :golfer
- belongs_to_active_hash :sex

##  articles テーブル

| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| title            | string     | null: false                    |
| content          | text       | null: false                    |
| url              | text       |                                |
| category_id      | integer    | null: false                    |
| user             | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one_attached :image
- belongs_to_active_hash :category
- has_many :comment
- has_many :favor

## golfers テーブル

| Column            | Type       | Options                        |
| ----------------- | ---------- | ------------------------------ |
| user              | references | null: false, foreign_key: true |
| average_score_id  | integer    | null: false                    |
| dominant_hand_id  | integer    | null: false                    |
| type_id           | integer    | null: false                    |
| golf_history_id   | integer    | null: false                    |
| worries           | text       |                                |
| feature           | text       |                                |
| average-putt      | integer    | null: false                    |

### Association

- belongs_to :user
- belongs_to_active_hash :category
- belongs_to_active_hash :dominant_hand
- belongs_to_active_hash :type
- belongs_to_active_hash :golf_history


## comment テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| user          | references | null: false, foreign_key: true |
| article       | references | null: false, foreign_key: true |
| comment       | text       |                                |

### Association

- belongs_to :user
- belongs_to :article

## favor テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| user          | references | null: false, foreign_key: true |
| article       | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :article