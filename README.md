# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...



# テーブル設計

## users テーブル

| Column                | Type    | Options                   |
| --------------------- | ------- | ------------------------- |
| nickname              | string  | null: false               |
| email                 | string  | null: false, unique: true |
| password              | string  | null: false               |
| password_confirmation | string  | null: false               |
| last_name             | string  | null: false               |
| first_name            | string  | null: false               |
| last_name_reading     | string  | null: false               |
| first_name_reading    | string  | null: false               |
| birth_year            | integer | null: false               |
| birth_month           | integer | null: false               |
| birth_day             | integer | null: false               |
  
### Association

- has_many :items
- has_many :orders

  



##  itemsテーブル
  
| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| name               | string     | null: false                    |
| info               | text       | null: false                    |
| category           | integer    | null: false                    |
| sales_status       | integer    | null: false                    |
| shipping_fee       | integer    | null: false                    |
| prefecture         | integer    | null: false                    |
| scheduled_delivery | integer    | null: false                    |
| price              | string     | null: false                    |
| user               | references | null: false, foreign_key: true |
  

### Association

- belongs_to :user
- has_one :order
- has_one_attached :image



  

## orders テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| user   | references | null: false, foreign_key: true |
| item   | references | null: false, foreign_key: true |


### Association

- belongs_to :user
- belongs_to :item
- has_one :address
  
  


## addresses テーブル

| Column       | Type       | Options                        |
| ------------ | ---------- | ------------------------------ |
| postal_code  | string     | null: false                    |
| prefecture   | integer    | null: false                    |
| city         | string     | null: false                    |
| addresses    | string     | null: false                    |
| building     | string     | null: false                    |
| phone_number | string     | null: false                    |
| order        | references | null: false, foreign_key: true |

  

### Association

- belongs_to :order












































