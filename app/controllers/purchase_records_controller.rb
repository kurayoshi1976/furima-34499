class PurchaseRecordsController < ApplicationController

  def index
    @item = Item.find(params[:item_id])
    @purchase_record = PurchaseRecord.new
  end

  def create
    @purchase_record = PurchaseRecords.new(purchase_records_params)
  end

  private
  def purchase_record_params
    params.require(:purchase_record).permit(:postal_code, :prefecture_id, :municipality, :house_number, :building, :phone_number).merge(user_id: current_user.id)
  end

end
