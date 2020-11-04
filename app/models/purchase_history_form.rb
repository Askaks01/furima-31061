class ItemPurchaseHistory

  include ActiveModel::Model
  attr_accessor :item, :user, :postal_code, :prefecture_id, :city, :house_num, :building_name, :phone_num, :purchase_history


  def save

  end

end