class PurchaseHistoriesController < ApplicationController
  def index
    @item = Item.find(params[:item_id])
    @purchase_history_form = PurchaseHistoryForm.new
  end

  def create
  end

end
