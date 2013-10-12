require 'spec_helper'

describe "Viewing an individual patient" do
	it "shows the patient's details" do
		patient = Patient.create(patient_attributes)	
		visit patient_url(patient)
		expect(page).to have_text(patient.born_on)
		expect(page).to have_text(patient.sex)
		expect(page).to have_text(patient.description)
		expect(page).to have_selector("img[src$='#{patient.image_file_name}']")
	end
	it "shows the patient's LAST, First name format" do
		patient = Patient.create(patient_attributes)
		visit patient_url(patient)

		expect(page).to have_text (patient.last_name.upcase + ", " + patient.given_name)
	end
end