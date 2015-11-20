class ConcertsController < ApplicationController

	def index
		@concerts = Concert.all
			if @concerts.empty?
				render 'no_concerts'
			end
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
	end

	private

	def concert_params
		params.require(:concert).permit(:band, :venue, :city, :date, :price, :description)
	end

end
