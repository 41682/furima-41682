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
- has_many :shipping_addresses

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
| category            | references | null: false, foreign_key: true |
| brand               | references | null: false, foreign_key: true |
| prefecture          | references | null: false, foreign_key: true |
| order               | references | null: true,foreign_key: true |

### Association

- belongs_to :user
- belongs_to :category
- belongs_to :brand
- belongs_to :prefecture 
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

## categories テーブル

| Column              | Type       | Options     |
| ------------------- | ---------- | ----------- |
| category_name       | string     | null: false |

### Association

- has_many :items

## brands テーブル

| Column              | Type       | Options     |
| ------------------- | ---------- | ----------- |
| brand_name          | string     | null: false |

### Association

- has_many :items

## prefectures テーブル

| Column              | Type       | Options     |
| ------------------- | ---------- | ----------- |
| prefecture_name     | string     | null: false |

### Association

- has_many :items
- has_many :shipping_addresses

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
- belongs_to :shipping_address

## shipping_addresses テーブル

| Column              | Type       | Options     |
| ------------------- | ---------- | ----------- |
| postal_code         | string     | null: false |
| city                | string     | null: false |
| addresses           | string     | null: false |
| building            | string     | null: true |
| phone_number        | string     | null: false |
| user                | references | null: false, foreign_key: true |
| prefecture          | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :prefecture
- has_many :orders
