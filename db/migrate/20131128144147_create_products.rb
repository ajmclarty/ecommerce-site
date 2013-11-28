class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name
      t.integer :quantity
      t.decimal :price
      t.string :description
      t.integer :stock_quantity

      t.timestamps
    end
  end
end
