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
- has_many :comments
- has_many :orders

## items テーブル

| Column              | Type       | Options     |
| ------------------- | ---------- | ----------- |
| name                | string     | null: false |
| info                | text       | null: false |
| sales_status        | string     | null: false |
| shipping_fee_status | string     | null: false |
| scheduled_delivery  | string     | null: false |
| price               | integer    | null: false |
| user                | references | null: false, foreign_key: true |
| order               | references | null: true,foreign_key: true |

### Association

- belongs_to :user
- has_one :order
- has_many :comments

## comments テーブル

| Column              | Type       | Options     |
| ------------------- | ---------- | ----------- |
| content             | text       | null: false |
| user                | references | null: false, foreign_key: true |
| item                | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item

## orders テーブル

| Column              | Type       | Options     |
| ------------------- | ---------- | ----------- |
| order_price         | integer    | null: false |
| postal_code         | string     | null: false |
| city                | string     | null: false |
| addresses           | string     | null: false |
| building            | string     | null: true |
| phone_number        | string     | null: false |
| user                | references | null: false, foreign_key: true |
| item                | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
