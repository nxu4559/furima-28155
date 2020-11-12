class Item < ApplicationRecord
  has_many :comments
  belongs_to_active_hash :condition
  belongs_to_active_hash :postage
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :category
  belongs_to_active_hash :days
  has_one :purchase
  belongs_to :user
  has_one_attached :image
end
