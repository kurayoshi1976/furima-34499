class ItemsController < ApplicationController
  before_action :authenticate_user!,except: [:index, :new,]

  def index
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

  private
  def item_params
    params.require(:item).permit(:name, :describe, :category, :item_condition, :shipping_charge, :prefecture, :delivery_time, :price, :image).(user_id: current_user.id)
  end

end
