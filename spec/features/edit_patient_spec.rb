require 'spec_helper'

describe "Editing a patient" do
  
  it "updates the patient and shows the patient's updated details" do
    patient = Patient.create(patient_attributes)
    
    visit patient_url(patient)
    
    click_link 'Edit'
    
    expect(current_path).to eq(edit_patient_path(patient))
        
    expect(find_field('Description').value).to eq(patient.description)
    fill_in 'Description', with: "Updated Patient Description"
    click_button 'Update Patient'
    expect(current_path).to eq(patient_path(patient))
    expect(page).to have_text('Updated Patient Description')
    expect(page).to have_text('Patient successfully updated!')
  end

  it "allows you to cancel and return to the list of patients" do
  	patient = Patient.create(patient_attributes)
  	visit patient_url(patient)
  	click_link 'Edit'
  	expect(current_path).to eq(edit_patient_path(patient))
  	click_link 'Cancel'
  	expect(current_path).to eq(patients_path)
  end
  it "does not update the patient if it's invalid" do
    patient = Patient.create(patient_attributes)
    visit edit_patient_url(patient)
    fill_in 'Given name', with: " "
    click_button "Update Patient"
    expect(page).to have_text('error')
  end
  
end