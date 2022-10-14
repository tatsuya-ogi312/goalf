# README

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
| favor         |        |                                |

### Association

- belongs_to :user
- belongs_to :article