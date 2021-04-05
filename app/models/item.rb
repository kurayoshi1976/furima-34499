class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :delivery_time
  belongs_to :item_condition
  belongs_to :prefecture
  belongs_to :shipping_charge

  belongs_to :user
  has_one_attached :image
  has_one :purchase_record

  with_options presence: true do
    validates :image
    validates :name, length: { maximum: 40 }
    validates :describe, length: { maximum: 1000 }
    validates :price, numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }
  end
  with_options numericality: { other_than: 1, message: 'Select' } do
    validates :category_id
    validates :item_condition_id
    validates :shipping_charge_id
    validates :prefecture_id
    validates :delivery_time_id
  end
end
