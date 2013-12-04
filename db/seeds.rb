# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

s = School.new(name: "School_A",
	             location: "43.5253 1253.5362",
	             bio: "This is the Bio")
s.password = "1234";
s.password_confirmation = "1234"
s.save