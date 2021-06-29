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

| Column         | Type           | Option      |
| -------------- | -------------- | ----------- |
| image          | active_storage | null: false |
| name           | string         | null: false |
| product        | text           | null: false |
| category       | text           | null: false |
| state          | text           | null: false |
| postage        | string         | null: false |
| region         | string         | null: false |
| shipping_date  | string         | null: false |
| price          | string         | null: false |

- belongs_to :user
- has_one :purchase

## purchase テーブル

| Column         | Type          | Option      |
| -------------- | ------------- | ----------- |
| price          | string        | null: false |
| status         | string        | null: false |
| user_id        | string        | null: false |
| item_id        | string        | null: false |

- belongs_to :item
- belongs_to :user
- has_one :delivery

## delivery テーブル

| Column             | Type          | Option      |
| ------------------ | ------------- | ----------- |
| postal_code        | string        | null: false |
| prefectures        | string        | null: false |
| municipal_district | string        | null: false |
| address            | string        | null: false |
| building_name      | string        | null: false |
 phone_number        | string        | null: false |

- belongs_to :purchase
