# README

# MODEL DESIGN

## users table

| Column                | Type    | Options      |
| --------------------- | ------- | ------------ |
| nickname              | string  | null: false  |
| email                 | string  | null: false  |
| password              | string  | null: false  |
| password-confirmation | string  | null: false  |
| first_name            | string  | null: false  |
| last_first_name       | string  | null: false  |
| kana_last_name        | string  | null: false  |
| birth_year            | integer | null: false  |
| birth_month           | integer | null: false  |
| birth_day             | integer | null: false  |

### User model association
- has_many :items
- has_many :comments
- has_many :orders

## items table

| Column              | Type      | Options                        |
| ------------------- | --------- | ------------------------------ |
| item_name           | string    | null: false                    |
| image               | string    | null: false                    |
| description         | text      | null: false                    |
| category            | integer   | null: false                    |
| status              | string    | null: false                    |
| price               | integer   | null: false                    |
| delivery_fee_bearer | string    | null: false                    |
| sender_area         | integer   | null: false                    |
| shipping_date       | string    | null: false                    |
| user                | reference | null: false, foreign_key: true |

### Item model association
- belongs_to :user
- has_many :comments
- has_one :order

## comments table

| Column  | Type      | Options                        |
| ------- | --------- | ------------------------------ |
| content | text      | null: false                    |
| user    | reference | null: false, foreign_key: true |
| item    | reference | null: false, foreign_key: true |

### Comment model association
- belongs_to :user
- belongs_to :item

## Order table

| Column                    | Type      | Options                        |
| ------------------------- | --------- | ------------------------------ |
| cc_number                 | integer   | null: false                    |
| cc_period_month           | integer   | null: false                    |
| cc_period_year            | integer   | null: false                    |
| cc_cvc                    | integer   | null: false                    |
| destination_postal_code   | integer   | null: false                    |
| destination_prefecture    | string    | null: false                    |
| destination_city          | string    | null: false                    |
| destination_address       | string    | null: false                    |
| destination_building      | string    | null: false                    |
| destination_phone         | integer   | null: false                    |
| user                      | reference | null: false, foreign_key: true |
| item                      | reference | null: false, foreign_key: true |

### Order model association
- belongs_to :user
- has_one :item