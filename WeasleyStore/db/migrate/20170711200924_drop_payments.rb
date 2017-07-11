class DropPayments < ActiveRecord::Migration[5.0]
  def change
  	drop_table :payments
  	drop_table :payment_line_items
  end
end
