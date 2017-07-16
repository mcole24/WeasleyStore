class AddTotalToOrders < ActiveRecord::Migration[5.0]
  def change
  	add_column :orders, :total_price, :integer, default: 0
  	add_column :orders, :completed, :boolean, default: false
  	remove_column :orders, :pay_type
  end
end
