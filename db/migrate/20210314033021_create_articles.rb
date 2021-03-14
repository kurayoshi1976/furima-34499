class CreateArticles < ActiveRecord::Migration[6.0]
  def change
    create_table :articles do |t|
      t.references :item,     foreign_key: true
      t.integer    :genre_id, null: false
      t.timestamps
    end
  end
end
