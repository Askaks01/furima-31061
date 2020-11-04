class PurchaseInfo < ApplicationRecord
  belongs_to :purchase_history
  belongs_to_active_hash :prefecture

end
