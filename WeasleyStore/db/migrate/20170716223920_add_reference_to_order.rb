class AddReferenceToOrder < ActiveRecord::Migration[5.0]
  def change
  	add_reference :orders, :charge, index: true
  end
end
