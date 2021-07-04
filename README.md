## users テーブル

| Column             | Type   | Option                    |
| ------------------ | ------ | ------------------------- |
| nickname           | string | null: false               |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false               |
| surname            | string | null: false               |
| name　　　　　　　　　| string | null: false               |
| surname_kana       | string | null: false               |
| name_kana          | string | null: false               |
| birthday           | date   | null: false               | 

- has_many :items
- has_many :purchases

## items テーブル

| Column            | Type       | Option                        |
| ----------------- | ---------- | ----------------------------- |
| name              | string     | null: false                   |
| product           | text       | null: false                   |
| category_id       | integer    | null: false                   |
| state_id          | integer    | null: false                   |
| postage_id        | integer    | null: false                   |
| prefecture_id     | integer    | null: false                   |
| shipping_date_id  | integer    | null: false                   |
| price             | integer    | null: false                   |
| user_id           | references | null: false foreign_key: true |

- belongs_to :user
- has_one :purchase

## purchases テーブル

| Column      | Type          | Option                        |
| ----------- | ------------- | ----------------------------- |
| user        | references    | null: false foreign_key: true |
| item        | references    | null: false foreign_key: true |

- belongs_to :item
- belongs_to :user
- has_one :delivery

## deliveries テーブル

| Column             | Type          | Option                        |
| ------------------ | ------------- | ----------------------------- |
| postal_code        | string        | null: false                   |
| prefectures_id     | integer       | null: false                   |
| municipal_district | string        | null: false                   |
| address            | string        | null: false                   |
| building_name      | string        |                               |
| phone_number       | string        | null: false                   |
| purchase_id        | references    | null: false foreign_key: true |

- belongs_to :purchase
