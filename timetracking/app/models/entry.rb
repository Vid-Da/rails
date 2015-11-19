class Entry < ActiveRecord::Base
	belongs_to :project

	validates :hours, :minutes, numericality: { only_integer: true }
	validates :date, :hours, :minutes, presence: true
	validates :project_id, presence: true

	def self.last_created_projects(number)
		Person.order('created_at DESC').limit(number)
	end

end
