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

* ...

# テーブル設計

## users テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| nickname           | string | null: false |
| email              | string | null: false |
| birthday           | date   | null: false |
| encrypted_password | string | null: false |
| first_name         | string | null: false |
| last_name          | string | null: false |
| first_name_kana    | string | null: false |
| last_name_kana     | string | null: false |

### Association

- has_many :items, comments
- has_many :purchases

## items テーブル

| Column            | Type       | Options                       |
| ----------------- | ---------- | ----------------------------- |
| name              | string     | null: false                   |
| description       | text       | null: false                   |
| category_id       | integer    | null: false                   |
| condition_id      | integer    | null: false                   |
| postage_prayer_id | integer    | null: false                   |
| prefecture_id     | integer    | null: false                   |
| days_id           | integer    | null: false                   |
| price             | integer    | null: false                   |
| user              | references | null: false, foreign_key: true|

### Association

- belongs_to :user
- has_many :comments
- belongs_to_active_hash :condition_id,postage_id,prefecture_id,category_id,days_id
- has_one :purchase

## address テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| post_code     | string     | null: false                    |
| prefecture_id | integer    | null: false                    |
| city          | string     | null: false                    |
| house_number  | string     | NOTNULL                        |
| building_name | string     |                                |
| phone_number  | string     | NOTNULL                        |
| purchase      | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to_active_hash :prefecture_id
- belongs_to :purchase

## purchases テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| user    | references | null: false, foreign_key: true |
| item    | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one :address

## comments テーブル

| Column     | Type       | Options                        |
| ---------- | ---------- | ------------------------------ |
| user_id    | references | null: false, foreign_key: true |
| item       | references | null: false, foreign_key: true |
| comment    | text       |                                |


### Association

- belongs_to :item
- belongs_to :user

