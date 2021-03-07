# テーブル設計

## users テーブル

| Column               | TYPE    | Options      |
| -------------------- | ------- | ------------ |
| nickname             | string  | not null     |
| email                | string  | unique: true |
| password             | string  | unique: true |
| last_name            | string  | not null     |
| first_name           | string  | not null     |
| last_name_katakana   | string  | not null     |
| first_name_katakana  | string  | not null     |

### Association

- has_many :items
- has_many :comments
- has_many :purchase_records

## items テーブル

| Column            | TYPE       | Options           |
| ----------------- | ---------- | ----------------- |
| item_image        | string     | not null          |
| item_name         | string     | not null          |
| describe          | string     | not null          | 
| category          | string     | not null          |
| item_condition    | string     | not null          |
| shipping_charges  | string     | not null          |
| ship_from         | string     | not null          |
| delivery_time     | string     | not null          |
| price             | integer    | not null          |
| user              | references | foreign_key: true |

### Association

-belongs_to :users
-has_many :comments
-has_one :purchases

## comments テーブル

| Column            | TYPE       | Options           |
| ----------------- | ---------- | ----------------- |
| comment           | text       | not null          |
| user              | references | foreign_key: true |
| item              | references | foreign_key: true |

### Association

-belongs_to :users
-belongs_to :items

## purchase_records テーブル

| Column | TYPE       | Options           |
| ------ | ---------- | ----------------- |
| user   | references | foreign_key: true |
| item   | references | foreign_key: true |

### Association
-belongs_to :users
-belongs_to :items
-has_one :delivery_address

## delivery_addresss テーブル

| Column        | TYPE       | Options           |
| ------------- | ---------- | ----------------- |
| postal_code   | integer    | not null          |
| prefecture    | string     | not null          |
| municipality  | text       | not null          |
| house_number  | text       | not null          |
| building      | text       | not null          |
| phone_number  | integer    | not null          |
| purchase_user | references | foreign_key: true |
| purchase_item | references | foreign_key: true |

### Association
-belongs_to :purchase_records
