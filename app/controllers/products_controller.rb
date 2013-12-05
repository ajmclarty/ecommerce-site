class ProductsController < ApplicationController
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
end
