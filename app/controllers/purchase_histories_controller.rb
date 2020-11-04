class PurchaseHistoriesController < ApplicationController
  def index
    @item_purchase_history = ItemPurchaseHistory.new
  end

  def create
    @purchase_history = PurchaseHistory.create(purchase_history_params)
  end

end
