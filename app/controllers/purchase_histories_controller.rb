class PurchaseHistoriesController < ApplicationController
  def index
    @item = Item.find(params[:item_id])
    @purchase_history_form = PurchaseHistoryForm.new
  end

  def create
    @item = Item.find(params[:item_id])
    @purchase_history_form = PurchaseHistoryForm.new(purchase_history_form_params)
    if @purchase_history_form.valid?
      @purchase_history_form.save
      redirect_to root_path
    else
      render action: :index
    end
  end

  private

  def purchase_history_form_params
    params.require(:purchase_history_form).permit(:postal_code, :prefecture_id, :city, :house_num, :phone_num, :building_name, :purchase_history_id).merge(user_id: current_user.id, item_id: params[:item_id])
  end

end
