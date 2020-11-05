class PurchaseHistoriesController < ApplicationController
  def index
    @item = Item.find(params[:item_id])
    @purchase_history_form = PurchaseHistoryForm.new
  end

  def create
    @purchase_history_form = PurchaseHistoryForm.new(purchase_history_form_params)
    if @purchase_history_form.save
      redirect_to root_path
    else
      render :index
    end
  end

end
