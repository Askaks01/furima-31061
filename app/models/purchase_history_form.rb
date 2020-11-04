class PurchaseHistoryForm

  include ActiveModel::Model
  attr_accessor :item, :user, :postal_code, :prefecture_id, :city, :house_num, :building_name, :phone_num, :purchase_history

  with_options presence: true do
    validates :postal_code, format: { with: /\A\d{3}\-?d{4}\z/ }
    validates :prefecture_id, numericality: { other_than: 1 }
    validates :city 
    validates :house_num
    validates :phone_num, format: { with: /\A\d{10,11}\z/ }
  end

  def save
    purchase_history = PurchaseHistory.create(user_id: current_user.id, item_id: params[:item_id]) 
    PurchaseInfo.create(postal_code: postal_code, prefecture_id: prefecture.id, city: city, house_num: house_num, phone_num: phone_num, building_name: building_name, purchase_history_id: purchase_history.id)
  end

end