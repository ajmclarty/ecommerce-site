class Product < ActiveRecord::Base
  attr_accessible :description, :name, :price, :quantity
  validates :description, :name, :price, :quantity, :presence => true
  validates :name, :uniqueness => true
  validates :price, :numericality => {:greater_than_or_equal_to => 0.01}
  validate :stock, :numericality => {:greater_than_or_equal_to => 0} 
  has_many :line_items
  belongs_to :category
end
