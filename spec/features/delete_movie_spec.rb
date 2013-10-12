require 'spec_helper'

describe "Deleting a patient" do 
  it "destroys the patient and shows the patient listing without the deleted patient" do
    patient = Patient.create(patient_attributes)

    visit patient_path(patient)
    
    click_link 'Delete'
    
    expect(current_path).to eq(patients_path)
    expect(page).not_to have_text(patient.last_name)
    expect(page).to have_text("Patient successfully deleted!")
  end
end