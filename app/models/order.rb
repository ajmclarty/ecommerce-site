class Order < ActiveRecord::Base
  attr_accessible :gst_rate, :hst_rate, :order_number, :pst_rate, :sub_total, :total, :customer_id
  has_many :line_items
  belongs_to :customer
end
