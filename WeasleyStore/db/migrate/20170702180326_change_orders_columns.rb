class ChangeOrdersColumns < ActiveRecord::Migration[5.0]
  def change
    remove_column :orders, :name
    add_column :orders, :first_name, :string
    add_column :orders, :last_name, :string
    add_column :orders, :city, :string
    add_column :orders, :state, :string
  end
end
