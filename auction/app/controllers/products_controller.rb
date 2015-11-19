class ProductsController < ApplicationController

	def index
	end

	def show
	end

	def new
		@user = User.find(params[:user_id])
		@product = @user.products.new
	end

	def create
		@user = User.find(params[:user_id])
		@product = @user.products.new

		if @product.save
			flash[:notice] = "Congratulations! product created"
			redirect_to @product
		else
			flash[:alert] = "Sorry, something went wrong.."
			render 'new'
		end	
	end

	def destroy
	end

end
