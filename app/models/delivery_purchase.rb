class DeliveryPurchase
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :token, :postal_code, :prefecture_id, :municipality, :house_number, :building, :phone_number

  with_options presence: true do
    validates :user_id
    validates :item_id
    validates :token
    validates :postal_code, format: { with: /\A\d{3}[-]\d{4}\z/ }  
    validates :municipality
    validates :house_number
    validates :phone_number, format: { with: /\A\d{11}\z/ }
  end
  validates :prefecture_id, numericality: { other_than: 1, message: 'select' }

  def save
    purchase_record = PurchaseRecord.create(user_id: user_id, item_id: item_id)
    DeliveryAddress.create(postal_code: postal_code, prefecture_id: prefecture_id, municipality: municipality, house_number: house_number, building: building, phone_number: phone_number, purchase_record_id: purchase_record.id )
  end

end