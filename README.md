# テーブル設計

## users テーブル

| Column               | TYPE    | Options                   |
| -------------------- | ------- | ------------------------- |
| nickname             | string  | null: false               |
| email                | string  | null: false, unique: true |
| encrypted_password   | string  | null: false,              |
| last_name            | string  | null: false               |
| first_name           | string  | null: false               |
| last_name_katakana   | string  | null: false               | 
| first_name_katakana  | string  | null: false               |
| birthday             | date    | null: false               |

### Association

- has_many :items
- has_many :comments
- has_many :purchase_records

## items テーブル

| Column             | TYPE       | Options           |
| ------------------ | ---------- | ----------------- |
| name               | string     | null: false       |
| describe           | text       | null: false       | 
| category_id        | integer    | null: false       |
| item_condition_id  | integer    | null: false       |
| shipping_charge_id | integer    | null: false       |
| prefecture_id      | integer    | null: false       |
| delivery_time_id   | integer    | null: false       |
| price              | integer    | null: false       |
| user               | references | foreign_key: true |

### Association

-belongs_to :user
-has_many :comments
-has_one :purchase_record

## comments テーブル

| Column            | TYPE       | Options           |
| ----------------- | ---------- | ----------------- |
| comment           | text       | null: false       |
| user              | references | foreign_key: true |
| item              | references | foreign_key: true |

### Association

-belongs_to :user
-belongs_to :item

## purchase_records テーブル

| Column | TYPE       | Options           |
| ------ | ---------- | ----------------- |
| user   | references | foreign_key: true |
| item   | references | foreign_key: true |

### Association
-belongs_to :user
-belongs_to :item
-has_one :delivery_address

## delivery_addresss テーブル

| Column          | TYPE       | Options           |
| --------------- | ---------- | ----------------- |
| postal_code     | string     | null: false       |
| prefecture_id   | integer    | null: false       |
| municipality    | string     | null: false       |
| house_number    | string     | null: false       |
| building        | string     |                   |
| phone_number    | string     | null: false       |
| purchase_record | references | foreign_key: true |

### Association
-belongs_to :purchase_record
