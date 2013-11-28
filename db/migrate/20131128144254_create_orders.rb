class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.integer :order_number
      t.decimal :pst_rate
      t.decimal :gst_rate
      t.decimal :hst_rate
      t.decimal :sub_total
      t.decimal :total

      t.timestamps
    end
  end
end
