# DB設計

## users テーブル

| Column              | Type    | Options     |
| ------------------- | ------- | ----------- |
| nickname            | string  | null: false |
| email               | string  | null: false, unique: true |
| encrypted_password  | string  | null: false |
| last_name           | string  | null: false |
| first_name          | string  | null: false |
| last_name_kana      | string  | null: false |
| first_name_kana     | string  | null: false |
| birth_date          | date    | null: false |

### Association

- has_many :items
- has_many :orders

## items テーブル

| Column              | Type       | Options     |
| ------------------- | ---------- | ----------- |
| name                | string     | null: false |
| info                | text       | null: false |
| category            | string     | null: false |
| brand               | string     | null: false |
| sales_status        | string     | null: false |
| shipping_fee_status | string     | null: false |
| item_prefecture     | string     | null: false |
| scheduled_delivery  | string     | null: false |
| price               | integer    | null: false |
| user                | references | null: false, foreign_key: true |
| order               | references | null: true,foreign_key: true |

### Association

- belongs_to :user
- has_one :order

## orders テーブル

| Column              | Type       | Options     |
| ------------------- | ---------- | ----------- |
| order_price         | integer    | null: false |
| user                | references | null: false, foreign_key: true |
| item                | references | null: false, foreign_key: true |
| shipping_address    | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one :shipping_address

## shipping_addresses テーブル

| Column              | Type       | Options     |
| ------------------- | ---------- | ----------- |
| postal_code         | string     | null: false |
| prefecture          | string     | null: false |
| city                | string     | null: false |
| addresses           | string     | null: false |
| building            | string     | null: true |
| phone_number        | string     | null: false |
| order               | references | null: false, foreign_key: true |

### Association

- belongs_to :order
