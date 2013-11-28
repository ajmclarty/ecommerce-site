class CreateCustomers < ActiveRecord::Migration
  def change
    create_table :customers do |t|
      t.string :name
      t.string :string
      t.string :address
      t.string :city
      t.string :postal_code
      t.string :province

      t.timestamps
    end
  end
end
