# テーブル設計

## users テーブル

| Column              | Type   | Options                  |
| ------------------- | ------ | ------------------------ |
| nickname            | string | null: false              |
| email               | string | null: false, unique: true|
| encrypted_password  | string | null: false              |
| first_name          | string | null: false              |
| last_name           | string | null: false              |
| first_name_furigana | string | null: false              |
| last_name_furigana  | string | null: false              |
| birthday            | date   | null: false              |

### Association

- has_many :items
- has_many :parchases

## items テーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| title              | string     | null: false                    |
| description        | text       | null: false                    |
| category_id        | integer    | null: false                    |
| item_status_id     | integer    | null: false                    |
| delivery_charge_id | integer    | null: false                    |
| prefecture_id      | integer    | null: false                    |
| delivery_date_id   | integer    | null: false                    |
| cost               | integer    | null: false                    |
| user               | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one :parchase

## parchases テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| user   | references | null: false, foreign_key: true |
| item   | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one :adress

## adresses テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| postal_code   | string     | null: false                    |
| prefecture_id | integer    | null: false                    |
| municipality  | string     | null: false                    |
| adress        | string     | null: false                    |
| building_name | string     |                                |
| phone_number  | string     | null: false                    |
| parchase      | references | null: false, foreign_key: true |

### Association

- belongs_to :parchase