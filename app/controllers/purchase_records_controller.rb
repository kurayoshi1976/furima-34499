class PurchaseRecordsController < ApplicationController
  before_action :set_item, only: [:index, :create]

  def index
    @delivery_purchase = PurchaseRecord.new
    redirect_to user_session_path unless user_signed_in?
    redirect_to root_path if user_signed_in? && !@item.purchase_record.nil?
  end

  def new
    @delivery_purchase = DeliveryPurchase.new
  end

  def create
    @delivery_purchase = DeliveryPurchase.new(delivery_purchase_params)
    if @delivery_purchase.valid?
      pay_item
      @delivery_purchase.save
      redirect_to root_path
    else
      @item = Item.find(params[:item_id])
      render :index
    end
  end

  private

  def delivery_purchase_params
    params.permit(:item_id, :postal_code, :prefecture_id, :municipality, :house_number, :building, :phone_number).merge(
      user_id: current_user.id, token: params[:token]
    )
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @item.price,
      card: delivery_purchase_params[:token],
      currency: 'jpy'
    )
  end

  def set_item
    @item = Item.find(params[:item_id])
  end
end
