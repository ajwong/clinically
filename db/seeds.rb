# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Patient.create!([
	{ 	last_name: "Doe",
		given_name: "John",
		born_on: "1970-12-30",
		uri: "123456",
		sex: "M",
		image_file_name: "male.png"
		description: "Well man"
	},
	{ 	last_name: "Smith",
		given_name: "Jane",
		born_on: "1969-11-29",
		uri: "123455",
		sex: "F",
		image_file_name: "female.png"
		description: "Well woman"
	},
	{ 	last_name: "Brown",
		given_name: "Lisa",
		born_on: "1968-10-29",
		uri: "123454",
		sex: "F",
		image_file_name: "female.png",
		description: "sick woman"
	}
])
patient = Patient.find_by(last_name: 'Doe')
patient.jobs.create!(category: "Pathology", description: "Order & Chase FBE", deadline_at: DateTime.new)
patient.jobs.create!(category: "Radiology", description: "Order CXR", deadline_at: DateTime.new)