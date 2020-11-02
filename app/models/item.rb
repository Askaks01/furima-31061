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

  with_options presence: true do
    validates :name, length: { maximum: 40 }
    validates :price, 
    :numericality => {
      greater_than_or_equal_to: 300,
      less_than_or_equal_to: 9999999
    }, 
    format: { with: /\A[0-9]+\z/ }
    validates :image
    validates :description, length: { maximum: 1000 }
  end
  with_options presence: true, numericality: { other_than: 1 } do
    validates :prefecture_id
    validates :category_id
    validates :condition_id
    validates :postage_id
    validates :shipping_day_id
  end 
  
end
