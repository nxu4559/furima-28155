# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version
  Ruby 2.6.5
* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions



# テーブル設計

## users テーブル

| Column   | Type   | Options     |
| -------- | ------ | ----------- |
| nickname | string | null: false |
| email    | string | null: false |
| password | string | null: false |
| birthday | string | null: false |
| user_id  | string | null: false |

### Association

- has_many :items, comments
- has_one  :purchase, address

## items テーブル

| Column         | Type       | Options                       |
| -------------- | ---------- | ----------------------------- |
| name           | string     | null: false                   |
| description    | text       | null: false                   |
| category       | integer    | null: false                   |
| condition      | integer    | null: false                   |
| postage_prayer | integer    | null: false                   |
| prefecture     | integer    | null: false                   |
| days           | integer    | null: false                   |
| price          | integer    | null: false                   |
| user_id        | references | null: false, foreign_key: true|

### Association

- has_many   :product_images
- belongs_to :users
- belongs_to :comments
- belongs_to_active_hash :condition,postage,prefecture

## address テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| post_code     | integer    | null: false                    |
| prefecture    | string     | null: false                    |
| city          | string     | null: false                    |
| house_number  | string     |                                |
| building_name | string     |                                |
| phone_number  | string     |                                |
| user_id       | references | null: false, foreign_key: true |

### Association

- belongs_to :users
- belongs_to_active_hash :prefecture

## product_image テーブル

| Column     | Type       | Options                        |
| ---------- | ---------- | ------------------------------ |
| image      | string     | null: false                    |
| product_id | string     | null: false, foreign_key: true |

### Association

- belongs_to :items

## purchase テーブル

| Column      | Type       | Options                        |
| ----------- | ---------- | ------------------------------ |
| user_id     | references | null: false, foreign_key: true |
| customer_id | string     | null: false,                   |
| card_id     | references | null: false, foreign_key: true |

### Association

- belongs_to :users

## comments テーブル

| Column     | Type       | Options                        |
| ---------- | ---------- | ------------------------------ |
| user_id    | references | null: false, foreign_key: true |
| item       | references | null: false, foreign_key: true |
| comment    | text       |                                |


### Association

- belongs_to :items
- belongs_to :users

