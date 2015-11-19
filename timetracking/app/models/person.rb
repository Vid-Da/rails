class Person < ActiveRecord::Base
	has_many :participations
	has_many :projects, through: :participations

	def self.last_created_people(number)
		Person.order('created_at DESC').limit(number)
	end

	def select_non_associated_project
		Project.all.select do |project|
			!self.projects.find_by(id: project.id)
		end
	end

end
