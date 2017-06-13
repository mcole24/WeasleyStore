class FixColumnName < ActiveRecord::Migration[5.0]
  def change
    rename_column :products, :price_cents, :galleons
  end
end
