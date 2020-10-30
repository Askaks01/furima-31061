class ItemsController < ApplicationController
  before_action :authenticate_user!, [ :index ]

  def index
    @itmes = Item.order("created_at DESC")
  end

  def new
    @itme = Item.new
  end

  def create
    @item = item.new(item_params)
    if @item.save
      redirect_to root_path
    else 
      render :new
    end
  end

  private 
  
  def item_params
    params.require(:item).permit(:name, :price, :image, :description, :prefecture_id, :category_id, :condition_id, :postage_id, :shipping_day_id).merge(user_id: current_user.id)
  end

end
