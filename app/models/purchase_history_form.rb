class PurchaseHistoryForm
  include ActiveModel::Model
  attr_accessor :item_id, :user_id, :postal_code, :prefecture_id, :city, :house_num, :building_name, :phone_num, :purchase_history, :token

  with_options presence: true do
    validates :postal_code, format: { with: /\A\d{3}-\d{4}\z/, message: 'input correctly' }
    validates :prefecture_id, numericality: { other_than: 1, message: 'Select' }
    validates :city
    validates :house_num
    validates :phone_num, format: { with: /\A\d{10,11}\z/, message: 'input only number' }
    validates :token
  end

  def save
    purchase_history = PurchaseHistory.create(user_id: user_id, item_id: item_id)
    PurchaseInfo.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city, house_num: house_num, phone_num: phone_num, building_name: building_name, purchase_history_id: purchase_history.id)
  end
end
