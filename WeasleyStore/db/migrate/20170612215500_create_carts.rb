class CreateCarts < ActiveRecord::Migration[5.0]
  def change
    create_table :carts do |t|
      t.references :user, foreign_key: true
      t.integer :items
      t.string :street1
      t.string :street2
      t.string :city
      t.string :state
      t.string :zip

      t.timestamps
    end
  end
end
