require 'spec_helper'

describe "Navigating patients" do
  it "allows navigation from the detail page to the listing page" do
    patient = Patient.create(patient_attributes)    

    visit patient_url(patient)

    click_link "All Patients"

    expect(current_path).to eq(patients_path)
  end
  it "allows navigation from the listing page to the detail page" do
    patient = Patient.create(patient_attributes(given_name: "Dod"))    

    visit patients_url
    click_link patient.last_name.upcase + ", " + patient.given_name
    expect(current_path).to eq(patient_path(patient))
  end
end