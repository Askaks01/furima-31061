#テーブル設計

## users テーブル

| Column         | Type   | Options     |
| -------------- | ------ | ----------- |
| nickname       | string | null: false |
| email          | string | null: false |
| first_name     | string | null: false |
| last_name      | string | null: false |
| first_furigana | string | null: false |
| last_furigana  | string | null: false |
| birthday       | date   | null: false |

### Association

- has_many :items
- has_many :purchase_histories
- belongs_to_active_hash :birthday

## items テーブル

| Column        | Type       | Option      |
| ------------- | ---------- | ----------- |
| item_name     | string     | null: false |
| category      | integer    | null: false |
| price         | integer    | null: false |
| user_id       | references | null: false |
| description   | text       | null: false |
| postage       | integer    | null: false |
| shipping_area | integer    | null: false |
| shipping_day  | integer    | null: false |

### Association

- belongs_to :user
- has_one :purchase_history
- belongs_to_active_hash :category
- belongs_to_active_hash :postage
- belongs_to_active_hash :shipping_area
- belongs_to_active_hash :shipping_day

## purchase_histories テーブル

| Column           | Type       | Option      |
| ---------------- | ---------- | ----------- |
| purchase_info_id | integer    | null: false, foreign_key: true |
| item_id          | integer    | null: false, foreign_key: true |
| user_id          | integer    | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one :purchase_info

## purchase_info テーブル

| Column              | Type       | Option      |
| ------------------- | ---------- | ----------- |
| address             | string     | null: false |
| phone_number        | string     | null: false |
| purchase_history_id | integer    | null: false, foreign_key: true |

### Association

- belongs_to :purchase_info



