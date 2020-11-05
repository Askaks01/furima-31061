class PurchaseInfo < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :purchase_history
  belongs_to_active_hash :prefecture

end
