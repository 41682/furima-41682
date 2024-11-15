# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

- has_many :items
- has_many :comments
- has_many :orders

* Configuration

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

* Database initialization

- belongs_to :user
- has_one :order
- has_many :comments

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

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
