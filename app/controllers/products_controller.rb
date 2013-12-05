class ProductsController < ApplicationController
	
	before_filter :initialize_session

	def index 
		@products = Product.all 
	end

	def show
		@product = Product.find(params[:id])
	end

	def search_results
		@products = Product.where("name LIKE ? OR description LIKE ?", "%#{params[:keywords]}%", "%#{params[:keywords]}%")
		@products = @products.where("category_id = ?", params[:category]) unless params[:category] == ""
	end

	def cart
		@customer = Customer.new
		@provinces = Province.all 
	end

protected
	def initialize_session
		@cart_contents ||=[]
		session[:cart] ||=[]
		session[:cart].each{|id| @cart_contents << Product.find(id)}
	end
end
