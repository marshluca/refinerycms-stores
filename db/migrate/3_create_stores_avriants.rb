class CreateVariants < ActiveRecord::Migration
  def change
    create_table :variants do |t|
      t.string :sku
      t.decimal :price
      t.decimal :weight
      t.decimal :height
      t.decimal :width
      t.decimal :depth
      t.boolean :is_master
      t.datetime :deleted_at
      t.references :product
      t.integer :count_on_hand
      t.decimal :cost_price
      t.integer :position

      t.timestamps
    end
    add_index :variants, :product_id
  end
end
