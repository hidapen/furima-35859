# テーブル設計

## users テーブル

| Column               | Type   | Options                  |
| -------------------- | ------ | ------------------------ |
| nickname             | string | null: false              |
| email                | string | null: false, unique: true|
| encrypted_password   | string | null: false              |
| first_name           | string | null: false              |
| last_name            | string | null: false              |
| first_name(furigana) | string | null: false              |
| last_name(furigana)  | string | null: false              |
| birthday             | date   | null: false              |

### Association

- has_many :items
- has_many :parchases

## items テーブル

| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| image           | string     | null: false                    |
| title           | string     | null: false                    |
| description     | text       | null: false                    |
| category        | string     | null: false                    |
| item_status     | string     | null: false                    |
| delivery_charge | string     | null: false                    |
| shipping_area   | string     | null: false                    |
| delivery_date   | date       | null: false                    |
| cost            | string     | null: false                    |
| user_id         | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one :parchase

## parchases テーブル

| Column    | Type       | Options                        |
| --------- | ---------- | ------------------------------ |
| user_id   | references | null: false, foreign_key: true |
| item_id   | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one :adress

## adresses テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| postal_code   | string     | null: false                    |
| prefectures   | string     | null: false                    |
| municipality  | string     | null: false                    |
| adress        | string     | null: false                    |
| building_name | string     | null: false                    |
| phone_number  | string     | null: false                    |
| parchase_id   | references | null: false, foreign_key: true |

### Association

- belongs_to :parchase