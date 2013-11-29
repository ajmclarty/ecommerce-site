class Customer < ActiveRecord::Base
  attr_accessible :address, :city, :name, :postal_code, :province
  validates :name, :address, :city, :postal_code, :province, :presence => true
  belongs_to :province
  has_many :orders
end
