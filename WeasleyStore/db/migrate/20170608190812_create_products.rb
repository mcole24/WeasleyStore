class CreateProducts < ActiveRecord::Migration[5.0]
  def change
    create_table :products do |t|
      t.string :product_name
      t.text :images
      t.decimal :weight
      t.integer :price_cents

      t.timestamps
    end
  end
end
