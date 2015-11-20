class Concert < ActiveRecord::Base
	validates :band, :venue, :city, :date, :price, :description, presence: true
	validates :price, numericality: true	 


	def self.concerts_today
		Concert.where(date: Date.today)
	end

	def self.concerts_month
		date_now = Date.current.tomorrow
		date_end_of_month = Date.current.end_of_month
		Concert.where(date: date_now..date_end_of_month)
	end

end
