
(1..25).each do |index|
	project = Project.create(name: "Project#{index}", description: "project description #{index}")
	
	project.entries.create(hours: 0, minutes: 30)

##(1..50) do |i|
##	random = Random.new
##	Entry.create(project_id: random.rand(25),
##		hours: random.rand(1),
##		minutes: random.rand(20),
##		comment: "comment #{index}",
##		date: Time.now)


end


# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
