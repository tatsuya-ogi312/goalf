# README

# アプリケーション名
GoalF

# アプリケーションの概要
ゴルフレッスンを受ける時間がない人やネットの情報がありふれているが故に、どの情報が最適なのかわからない人にみんなが何を参考にしているかを共有できる掲示板

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
「私の趣味がゴルフなのですが、ゴルフをする上で2つの課題を抱えていました。
1つは、レッスンに通えるほどお金と時間に余裕があるわけではなく、同じ課題を抱える方が世の中にたくさんいると思いました。
2つ目は、ネット上にゴルフレッスンの情報があふれていますが、情報の中身がそれぞれ違ったり、どれを参考にしていいかわからないという課題を感じていました。
これらの課題を解決するため、ユーザーの体格（身長・体重等）ごとにどの情報を参考にしているのかを整理できるアプリ開発を考案しました。
このアプリを使うことで、どの情報が自分に最適なのかが明確になり、それに基づいて練習することで全国のアマチュアゴルファーに貢献できるのではと考え、開発に至りました。」
# 洗い出した要件
https://docs.google.com/spreadsheets/d/1HpFQTvdMKTT9EgMP2IG73zeQFJVtvMz6-qO6jGBkFcs/edit

# 実装した機能について
・ユーザー管理機能
・記事投稿、編集、削除機能
・記事へのコメント機能【Action Cable】
・ユーザー情報追加機能
・お気に入り機能【jQuery】
・楽天APIでのゴルフ場検索機能

# 実装予定機能
・DMやチャットルームなどユーザー同士が直接連絡が取れる方法を作成する
→色んなユーザーが一緒にゴルフに行けるようなコミュニティや連絡手段があれば、よりゴルフへの関心意欲が増えるため
・管理者権限を設けて、管理者が記事を削除できた李、アカウントの存続の可否を決めることができる
→公序良俗に反したり、本来の目的から逸脱する内容やユーザーを排除するため

# データベース設計
goalf.dioに記載

# 画面遷移図
transition.dioに記載

# 開発環境
フロントエンド
バックエンド
タスク管理

# 工夫したポイント
・投稿記事に画像が添付されていない場合は、「No Image」が勝手に配置されるようにしました。
・投稿したリンクにアクセスする場合は別タブで開かれるようにしました。
・コメントならびにお気に入り機能は非同期通信で更新されるように実装しました。
・閲覧数を監視するGemを導入して、その記事の価値を生み出す閲覧数とお気に入り数を表示できるようにしました。

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
| average_putt      | integer    | null: false                    |

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
| comment       | text       | null: false                    |

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