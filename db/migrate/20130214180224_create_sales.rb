class CreateSales < ActiveRecord::Migration
  def change
    create_table :sales do |t|
      t.string :purchaser_name
      t.text :item_description
      t.decimal :item_price, :precision=>16, :scale=>2
      t.integer :purchase_count
      t.string :merchant_address
      t.string :merchant_name

      t.timestamps
    end
  end
end
