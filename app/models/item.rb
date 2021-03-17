class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  with_options presence: true do
    validates :image
    validates :name, length: {maximum: 40 }
    validates :describe, length: {maximum: 1000 }
    validates :price, numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999}
  end
  with_options numericality: { other_than: 1, message: 'Select' } do
    validates :category_id
    validates :item_condition_id
    validates :shipping_charge_id
    validates :prefecture_id
    validates :delivery_time_id
  end
    
end