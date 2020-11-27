# README

# MODEL DESIGN

## users table

| Column                | Type    | Options      |
| --------------------- | ------- | ------------ |
| nickname              | string  | null: false  |
| email                 | string  | null: false  |
| encrypted_password    | string  | null: false  |
| first_name            | string  | null: false  |
| last_name             | string  | null: false  |
| kana_first_name       | string  | null: false  |
| kana_last_name        | string  | null: false  |
| birth_date            | date    | null: false  |

### User model association
- has_many :items
- has_many :comments
- has_many :orders

## items table

| Column                 | Type    | Options                        |
| ---------------------- | ------- | ------------------------------ |
| item_name              | string  | null: false                    |
| description            | text    | null: false                    |
| category_id            | integer | null: false                    |
| status_id              | integer | null: false                    |
| price_id               | integer | null: false                    |
| delivery_fee_bearer_id | integer | null: false                    |
| sender_area_id         | integer | null: false                    |
| shipping_date_id       | integer | null: false                    |
| user_id                | integer | null: false, foreign_key: true |

### Item model association
- belongs_to :user
- has_many :comments
- has_one :order

## comments table

| Column  | Type    | Options                        |
| ------- | ------- | ------------------------------ |
| content | text    | null: false                    |
| user_id | integer | null: false, foreign_key: true |
| item_id | integer | null: false, foreign_key: true |

### Comment model association
- belongs_to :user
- belongs_to :item

## orders table

| Column         | Type    | Options                        |
| -------------- | ------- | ------------------------------ |
| order_date     | integer | null: false                    |
| user_id        | integer | null: false, foreign_key: true |
| item_id        | integer | null: false, foreign_key: true |

### Order model association
- belongs_to :user
- has_one :item
- has_one :destination

## destinations table

| Column                    | Type    | Options                        |
| --------------------------| ------- | ------------------------------ |
| destination_postal_code   | string  | null: false                    |
| destination_prefecture_id | integer | null: false                    |
| destination_city          | string  | null: false                    |
| destination_house_number  | string  | null: false                    |
| destination_building      | string  | null: false                    |
| destination_phone         | string  | null: false                    |
| order_id                  | integer | null: false, foreign_key: true |

### Destination model
- has_one :order