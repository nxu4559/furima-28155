class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  has_one :purchase

  with_options presence: true do
    validates :image
    validates :name
    validates :description
    validates :category_id
    validates :condition_id
    validates :postage_prayer_id
    validates :prefecture_id
    validates :days_id
    validates :price, format: { with: /\A\d+\z/ },
                      numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }
  end

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :postage_prayer
  belongs_to :prefecture
  belongs_to :days

  with_options numericality: { other_than: 1 } do
    validates :category_id
    validates :condition_id
    validates :postage_prayer_id
    validates :prefecture_id
    validates :days_id
  end
end
