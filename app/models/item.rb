class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :category
  belongs_to_active_hash :condition
  belongs_to_active_hash :postage
  belongs_to_active_hash :shipping_day
  belongs_to :user
  has_one_attached :image
  has_one :purchase_history

  validates :name, :price, :description, :prefecture, :category, :condition, :postage, :shipping_day,  presence: true
  validates :prefecture_id, :category_id, :condition_id, :postage_id, :shipping_day_id, numericality: { other_than: 1 }
end
