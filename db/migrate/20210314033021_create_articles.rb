class CreateArticles < ActiveRecord::Migration[6.0]
  def change
    create_table :articles do |t|
      t.references :item,               foreign_key: true
      t.integer    :category_id,        null: false
      t.integer    :delivery_time_id,   null: false
      t.integer    :item_condition_id,  null: false
      t.integer    :prefecture_id,      null: false 
      t.integer    :shipping_charge_id, null: false
      t.timestamps
    end
  end
end
