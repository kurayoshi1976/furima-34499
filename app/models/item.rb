class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image

end

with_options presence: true do
  validates :image
  validates :name
  validates :describe
  validates :category_id
  validates :item_condition_id
  validates :shipping_charge_id
  validates :prefecture_id
  validates :delivery_time_id
  validates :price, :format: { with /\A[0-9]+\z/ }, if:
    :price?
      def price?
        if price? >= 300 && price? <= 9999999
        end
      end
end