#テーブル設計

## users テーブル

| Column     | Type   | Options     |
| ---------- | ------ | ----------- |
| nickname   | string | null: false |
| email      | string | null: false |
| password   | string | null: false |
| first_name | string | null: false |
| last_name  | string | null: false |
| first_kana | string | null: false |
| last_kana  | string | null: false |
| birthday   | date   | null: false |

### Association

- has_many :items
- has_many :purchase_histories
- belongs_to_active_hash :birthday

## items テーブル

| Column          | Type       | Option      |
| --------------- | ---------- | ----------- |
| name            | string     | null: false |
| category_id     | integer    | null: false |
| price           | integer    | null: false |
| user            | references | null: false |
| condition_id    | integer    | null: false |
| description     | text       | null: false |
| postage_id      | integer    | null: false |
| prefecture_id   | integer    | null: false |
| shipping_day_id | integer    | null: false |

### Association

- belongs_to :user
- has_one :purchase_history
- belongs_to_active_hash :category
- belongs_to_active_hash :postage
- belongs_to_active_hash :shipping_area
- belongs_to_active_hash :shipping_day

## purchase_histories テーブル

| Column        | Type       | Option                         |
| ------------- | ---------- | ------------------------------ |
| item          | references | null: false, foreign_key: true |
| user          | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one :purchase_info

## purchase_info テーブル

| Column           | Type       | Option                         |
| ---------------- | ---------- | ------------------------------ |
| postal_code      | string     | null: false                    |
| prefecture_id    | integer    | null: false                    |
| city             | string     | null: false                    |
| house_num        | string     | null: false                    |
| building_name    | string     |                                |
| phone_num        | string     | null: false                    |
| purchase_history | references | null: false, foreign_key: true |

### Association

- belongs_to :purchase_histories



