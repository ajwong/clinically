require 'spec_helper'

describe "Creating a new job" do 
  it "saves the review" do    
    patient = Patient.create(patient_attributes)

    visit patient_url(patient)
    
    click_link 'Create Job'
    
    expect(current_path).to eq(new_patient_job_path(patient))
    
    select 'Pathology', :from => "job_category"
    fill_in "Description", with: "Test"
            
    click_button 'Create Job'
  
    expect(current_path).to eq(patient_jobs_path(patient))
    
    expect(page).to have_text("Job successfully created!")
  end
  
  it "does not save the job if it's invalid" do
    patient = Patient.create(patient_attributes)
    
    visit new_patient_job_url(patient)
    
    expect { 
      click_button 'Create Job' 
    }.not_to change(Job, :count)
        
    expect(page).to have_text('error')
  end
end