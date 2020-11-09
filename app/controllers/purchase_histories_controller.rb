class PurchaseHistoriesController < ApplicationController
  before_action :authenticate_user!
  before_action :move_to_item_index
  before_action :sold_out

  def index
    @item = Item.find(params[:item_id])
    @purchase_history_form = PurchaseHistoryForm.new
  end

  def create
    @item = Item.find(params[:item_id])
    @purchase_history_form = PurchaseHistoryForm.new(purchase_history_form_params)
    if @purchase_history_form.valid?
      pay_item
      @purchase_history_form.save
      redirect_to root_path
    else
      render action: :index
    end
  end

  private

  def purchase_history_form_params
    params.require(:purchase_history_form).permit(:postal_code, :prefecture_id, :city, :house_num, :phone_num, :building_name, :purchase_history_id).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  def move_to_item_index
    @item = Item.find(params[:item_id])
    redirect_to root_path if @item.user_id == current_user.id
  end

  def sold_out
    @item = Item.find(params[:item_id])
    redirect_to root_path unless @item.purchase_history.nil?
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @item.price,
      card: purchase_history_form_params[:token],
      currency: 'jpy'
    )
  end
end
