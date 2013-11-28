class Order < ActiveRecord::Base
  attr_accessible :gst_rate, :hst_rate, :order_number, :pst_rate, :sub_total, :total
end
