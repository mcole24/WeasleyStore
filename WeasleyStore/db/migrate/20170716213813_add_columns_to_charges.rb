class AddColumnsToCharges < ActiveRecord::Migration[5.0]
  def change
  	add_column :charges, :first_name, :string
  	add_column :charges, :last_name, :string
  	add_column :charges, :address, :string
  	add_column :charges, :city, :string
  	add_column :charges, :state, :string
  	add_column :charges, :email, :string
  	add_column :charges, :total_price, :integer
  end
end
