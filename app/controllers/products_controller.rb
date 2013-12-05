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

	def add_cart
		id = params[:id].to_i
		session[:cart] << id unless session[:cart].include?(id)
		redirect_to(:back)
	end

	def remove_cart
		reset_session
		redirect_to(:back)
	end

	def checkout
		@customer = Customer.create(params[:customer])
		@order = @customer.orders.build
		@order.pst_rate = @customer.province.pst
		@order.gst_rate = @customer.province.gst
		@order.hst_rate = @customer.province.hst
		@order.save
		@cart_contents.each do |item|
			line_item = @order.line_items.build
			line_item.product_id = item.id
			line_item.price = item.price
			line_item.save
		end

		redirect_to :action => :index
	end

protected
	def initialize_session
		@cart_contents ||=[]
		session[:cart] ||=[]
		session[:cart].each{|id| @cart_contents << Product.find(id)}
	end
end
