class PurchaseRecordsController < ApplicationController

  def index
    @item = Item.find(params[:item_id])
    @delivery_purchase = PurchaseRecord.new
  end

  def new
    @delivery_purchase = DeliveryPurchase.new
  end

  def create
    @delivery_purchase = DeliveryPurchase.new(delivery_purchase_params)
    if @delivery_purchase.valid?
      @delivery_purchase.save
      redirect_to root_path
    else
      @item = Item.find(params[:item_id])
      render :index
    end
  end

  private
  def delivery_purchase_params
    params.permit(:item_id, :postal_code, :prefecture_id, :municipality, :house_number, :building, :phone_number).merge(user_id: current_user.id)
  end

end
