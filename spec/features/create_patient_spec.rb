require 'spec_helper'

describe "Creating a new patient" do 
  it "saves the patient and shows the new patient's details" do    
    visit patients_url
    
    click_link 'Add New Patient'
    
    expect(current_path).to eq(new_patient_path)
		
    fill_in "Last name", with: "Smith"
    fill_in "Given name", with: "Jane"
    fill_in "Uri", with: "123456"
    choose "Female"
    fill_in "Image file name", with: "face.png"
    select (Time.now.year - 1).to_s, :from => "patient_born_on_1i"
    fill_in "Description", with: "This is an empty record"
    click_button 'Create Patient'

    expect(current_path).to eq(patient_path(Patient.last))   
    
    expect(page).to have_text("SMITH, Jane")
    expect(page).to have_text("123456")
    expect(page).to have_text("F")
    expect(page).to have_text("This is an empty record")
    expect(page).to have_text("Patient successfully created!")
  
  end
    it "does not save the patient if it's invalid" do
        visit new_patient_url
        expect { 
            click_button 'Create Patient' 
        }.not_to change(Patient, :count)
        expect(current_path).to eq(patients_path)   
        expect(page).to have_text('error')
    end
end