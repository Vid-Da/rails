require 'pry'

class Project < ActiveRecord::Base
	has_many :entries

	validates :name, uniqueness: true
	validates :name, presence: true
	validates :name, length: { maximum: 30 }
	validates :name, format: { with: /\A[a-zA-Z0-9\ ]+\z/ }


	def self.iron_find(params)
		where(params).first
	end		

	def self.clean_old
		where('created_at < ?', 1.week.ago).destroy_all
	end

	def self.last_created_projects(number)
		Project.order('created_at DESC').limit(number)
	end

	def self.first_updated_projects(number)
		Project.order('updated_at ASC').limit(number)
	end

	def total_hours_in_month(month, year)
		date_start = Date.new(year, month, 1)
		date_end = Date.new(year, month, -1)
		month_entries = self.entries.where(date: date_start..date_end)

		total_minutes = month_entries.reduce(0) do |sum, entry|
			sum + entry.minutes + entry.hours * 60
		end

		total_hours = total_minutes / 60.0
	end

		##from = Date.new(year, month, 1)
		##to = from.end_of_month

		##total_hours = month.entries.sum(&:hour)
		##total_minutes = month.entries.sum(&:minutes)
end
