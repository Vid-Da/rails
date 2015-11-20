Concert.create(band: "2 doors cinema club", venue: "La Riviera", city: "Madrid", date: Date.current, price: 20, description: "Finally they are in the capital")
Concert.create(band: "Foo Fighters", venue: "My place", city: "LA", date: Date.yesterday, price: 50, description: "Broken leg")
Concert.create(band: "The Beatles", venue: "The cave", city: "London", date: Date.tomorrow, price: 60, description: "Back to town after a while!")


# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
