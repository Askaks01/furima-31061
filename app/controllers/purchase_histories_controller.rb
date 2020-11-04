class PurchaseHistoriesController < ApplicationController
  def index
    @item = Item.find(params[:id])
    @purchase_history_form = PurchaseHistoryForm.new
  end

  def create
  end

end
