class ConcertsController < ApplicationController

	def index
		@concerts = Concert.all
		@concerts_today = @concerts.concerts_today
		@concerts_month = @concerts.concerts_month
	end

	def new
		@concert = Concert.new
	end

	def create
		@concert = Concert.new(concert_params)

		if @concert.save
			flash[:notice] = 'Concert created successfully'
			redirect_to action: 'index', controller: 'concerts'
		else
			flash[:alert] = 'Sorry, something went wrong..'
			render 'new'
		end	
	end

	def show
		@concert = Concert.find_by(id: params[:id])
			@comment = @concert.comments.new
		@comments = @concert.comments
	end

	def edit
		@concert = Concert.find(params[:id])
	end

	def update
		@concert = Concert.find(params[:id])

		if @concert.update_attributes(concert_params)
			flash[:notice] = 'Comment added successfully'
			redirect_to action: 'show', controller: 'concerts', concert_id: @concert.id
		else
			flash[:notice] = 'Sorry, something went wrong..'
			render 'show'
		end
	end

	def budget
		@concerts = Concert.all
		@list = @concerts.where('price < ?',(params[:price]).to_i)

	end

	private

	def concert_params
		params.require(:concert).permit(:band, :venue, :city, :date, :price, :description, :comment)
	end

end
