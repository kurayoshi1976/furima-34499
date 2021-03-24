class PurchaseRecordsController < ApplicationController

  def index
    @item = Item.find(params[:item_id])
  end

  def create
    # @purchase_records = PurchaseRecords.new(purchase_records.params)
  end

  private

end
