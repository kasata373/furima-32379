## users テーブル

| Column     | Type   | Option    |
| ---------- | ------ | --------- |
| nickname   | string | NOT: NULL |
| email      | string | NOT: NULL |
| password   | string | NOT: NULL |
| name       | string | NOT: NULL |
| birthday   | text   | NOT: NULL |

- has_many :items
- has_many :purchases

## items テーブル

| Column         | Type          | Option    |
| -------------- | ------------- | --------- |
| image          | ActiveStorage | NOT: NULL |
| name           | string        | NOT: NULL |
| catch_copy     | text          | NOT: NULL |
| state          | text          | NOT: NULL |

- belongs_to :user
- has_one :purchase

## purchase テーブル

| Column         | Type          | Option    |
| -------------- | ------------- | --------- |
| price          | string        | NOT: NULL |
| product        | string        | NOT: NULL |
| buyer_id       | string        | NOT: NULL |

- belongs_to :item
- belongs_to :user
- has_one :delivery

## delivery テーブル

| Column         | Type          | Option    |
| -------------- | ------------- | --------- |
| postage        | string        | NOT: NULL |
| region         | string        | NOT: NULL |
| shipping_date  | string        | NOT: NULL |

- belongs_to :purchase
