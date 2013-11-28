class Customer < ActiveRecord::Base
  attr_accessible :address, :city, :name, :postal_code, :province, :string
end
