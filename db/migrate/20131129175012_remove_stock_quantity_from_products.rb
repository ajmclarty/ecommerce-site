class RemoveStockQuantityFromProducts < ActiveRecord::Migration
  def up
    remove_column :products, :stock_quantity
  end

  def down
    add_column :products, :stock_quantity, :integer
  end
end
