## users テーブル

| Column             | Type   | Option       |
| ------------------ | ------ | ------------ |
| nickname           | string | null: false  |
| email              | string | unique: true |
| encrypted_password | string | null: false  |
| surname            | string | null: false  |
| name　　　　　　　　　| string | null: false  |
| surname_kana       | string | null: false  |
| name_kana          | string | null: false  |
| birthday           | date   | null: false  |

- has_many :items
- has_many :purchases

## items テーブル

| Column         | Type    | Option                        |
| -------------- | ------- | ----------------------------- |
| name           | string  | null: false                   |
| product        | text    | null: false                   |
| category       | text    | null: false                   |
| state          | text    | null: false                   |
| postage        | integer | null: false foreign_key: true |
| region         | integer | null: false foreign_key: true |
| shipping_date  | integer | null: false foreign_key: true |
| price          | integer | null: false foreign_key: true |

- belongs_to :user
- has_one :purchase

## purchase テーブル

| Column         | Type          | Option                        |
| -------------- | ------------- | ----------------------------- |
| user_id        | references    | null: false foreign_key: true |
| item_id        | references    | null: false foreign_key: true |

- belongs_to :item
- belongs_to :user
- has_one :delivery

## delivery テーブル

| Column             | Type          | Option      |
| ------------------ | ------------- | ----------- |
| postal_code        | string        | null: false |
| prefectures        | integer       | null: false |
| municipal_district | string        | null: false |
| address            | string        | null: false |
| building_name      | string        |             |
| phone_number       | string        | null: false |

- belongs_to :purchase
