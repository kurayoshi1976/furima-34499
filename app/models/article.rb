class Article < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category, :delivery_time, :item_condition, :prefecture, :shipping_charge

  validates :item_id, presence: true
    with_options numericality: { other_than: 1 } do
      validates :category_id
      validates :delivery_time_id
      validates :item_condition_id
      validates :prefecture_id
      validates :shipping_charge_id
    end
end
