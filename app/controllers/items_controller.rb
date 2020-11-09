class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :move_to_index, only: [:edit, :destory]
  before_action :sold_out, only: :edit
  before_action :item_find, only: [:edit, :update, :show, :destroy, :move_to_index, :sold_out]

  def index
    @items = Item.order('created_at DESC')
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to item_path
    else
      render :edit
    end
  end

  def destroy
    @item.destroy
    redirect_to root_path
  end

  private

  def item_find
    @item = Item.find(params[:id])
  end

  def item_params
    params.require(:item).permit(:name, :price, :image, :description, :prefecture_id, :category_id, :condition_id, :postage_id, :shipping_day_id).merge(user_id: current_user.id)
  end

  def move_to_index
    redirect_to action: :index unless @item.user_id == current_user.id
  end

  def sold_out
    redirect_to root_path unless @item.purchase_history.nil?
  end
end
