class DropTables < ActiveRecord::Migration[5.0]
  def change
    drop_table :shopping_carts
    drop_table :shopping_cart_items
  end
end
