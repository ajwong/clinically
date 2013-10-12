require 'spec_helper'

describe "Viewing the list of patients" do
#	it "shows the patients alphabetically" do 
#		patient1 = Patient.create(patient_attributes(last_name: 'Alpha'))
#		patient2 = Patient.create(patient_attributes(last_name: 'Gamma'))
#		patient3 = Patient.create(patient_attributes(last_name: 'Beta'))
#		expect(Patient.all.alphabetical).to eq([patient1,patient3,patient2])		
#	end

	it "shows the patients" do
		patient1 = Patient.create(	last_name: "Doe",
									given_name: "John",
									born_on: "1970-12-30",
									uri: "123456",
									description: "Well man",
									sex: "M")

		patient2 = Patient.create(	last_name: "Smith",
									given_name: "Jane",
									born_on: "1969-11-29",
									uri: "123455",
									description: "Well woman",
									sex:"F")

		patient3 = Patient.create(	last_name: "Brown",
									given_name: "Lisa",
									born_on: "1968-10-29",
									uri: "123454",
									description: "sick woman",
									sex:"F")
		visit patients_url
		expect(page).to have_text("Patients")
		expect(page).to have_text(patient1.last_name.upcase)
		expect(page).to have_text(patient1.given_name)
		expect(page).to have_text(patient1.born_on)
		expect(page).to have_text(patient1.uri)
		expect(page).to have_text(patient1.description[0..9])
		expect(page).to have_text(patient2.last_name.upcase)
		expect(page).to have_text(patient2.given_name)
		expect(page).to have_text(patient2.born_on)
		expect(page).to have_text(patient2.uri)
		expect(page).to have_text(patient2.description[0..9])
		expect(page).to have_text(patient3.last_name.upcase	)
		expect(page).to have_text(patient3.given_name)
		expect(page).to have_text(patient3.born_on)
		expect(page).to have_text(patient3.uri)
		expect(page).to have_text(patient3.description[0..9])	
		expect(page).to have_selector("img[src$='#{patient1.image_file_name}']")	
	end
end