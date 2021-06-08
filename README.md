# テーブル設計

## users テーブル

| Column             | Type     | Options     |
| ------------------ | -------- | ----------- |
| nickname           | string   | null: false |
| email              | string   | null: false |
| encrypted_password | string   | null: false |
| name               | string   | null: false |
| birthday           | datetime | null: false |

### Association

- has_many :items
- has_many :parchases

## items テーブル

| Column      | Type       | Options                        |
| ----------- | ---------- | ------------------------------ |
| title       | string     | null: false                    |
| description | text       | null: false                    |
| user_id     | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_many :parchases

## parchases テーブル

| Column    | Type       | Options                        |
| --------- | ---------- | ------------------------------ |
| card      | string     | null: false                    |
| user_id   | references | null: false, foreign_key: true |
| item_id   | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one :adress

## adresses テーブル

| Column      | Type       | Options                        |
| ----------- | ---------- | ------------------------------ |
| adress      | string     | null: false                    |
| parchase_id | references | null: false, foreign_key: true |

### Association

- belongs_to :parchase