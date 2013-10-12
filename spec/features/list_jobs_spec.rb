require 'spec_helper'

describe "Viewing a list of jobs" do
  
  it "shows the job for a specific patient" do
    patient1 = Patient.create(patient_attributes(last_name: "Stark"))
    job1 = patient1.jobs.create(job_attributes(description: "Chase CXR"))
    job2 = patient1.jobs.create(job_attributes(description: "Chase MRI"))


    patient2 = Patient.create(patient_attributes(last_name: "Clarke"))
    job3 = patient2.jobs.create(job_attributes(description: "Check CT"))
    
    visit patient_jobs_url(patient1)
        
    expect(page).to have_text(job1.description)
    expect(page).to have_text(job2.description)
    expect(page).not_to have_text(job3.description)
  end
end