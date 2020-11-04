class PurchaseInfo < ApplicationRecord
  belongs_to :purchase_history

  with_options presence: true do
    validates :postal_code,
    validates :prefecture_id, numericality: { other_than: 1 }
    validates :city, 
    validates :house_num,
    validates :phone_num,
  end

  validates :building_name,


end
