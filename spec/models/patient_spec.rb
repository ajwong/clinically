require 'spec_helper'
describe " A patient" do
	it "requires a last name" do
	  patient = Patient.new(last_name: "")
	  
	  expect(patient.valid?).to be_false # populates errors
	  expect(patient.errors[:last_name].any?).to be_true
	end

	it "requires a given name" do
	  patient = Patient.new(given_name: "")
	  
	  expect(patient.valid?).to be_false
	  expect(patient.errors[:given_name].any?).to be_true
	end

	it "requires a born on date" do
	  patient = Patient.new(born_on: "")
	  
	  expect(patient.valid?).to be_false
	  expect(patient.errors[:born_on].any?).to be_true
	end

	it "requires a description" do
	  patient = Patient.new(description: "")
	  
	  expect(patient.valid?).to be_false
	  expect(patient.errors[:description].any?).to be_true
	end

	it "requires a sex" do
	  patient = Patient.new(sex: "")
	  
	  expect(patient.valid?).to be_false
	  expect(patient.errors[:sex].any?).to be_true
	end

	it "accepts a sex of M" do
	  patient = Patient.new(sex: "F")

	  expect(patient.valid?).to be_false
	  expect(patient.errors[:sex].any?).to be_false
	end

	it "accepts a sex of F" do
	  patient = Patient.new(sex: "M")

	  expect(patient.valid?).to be_false
	  expect(patient.errors[:sex].any?).to be_false
	end

	it "requires a uri" do
	  patient = Patient.new(uri: "")

	  expect(patient.valid?).to be_false
	  expect(patient.errors[:uri].any?).to be_true
	end

	it "accepts properly formatted image file names" do
	  file_names = %w[patient.png patient.jpg patient.gif PATIENT.GIF]
	  file_names.each do |file_name|
	    patient = Patient.new(image_file_name: file_name)
	    
	    expect(patient.valid?).to be_false
	    expect(patient.errors[:image_file_name].any?).to be_false
	  end
	end

	it "rejects improperly formatted image file names" do
	  file_names = %w[patient .jpg .png .gif patient.pdf patient.doc]
	  file_names.each do |file_name|
	    patient = Patient.new(image_file_name: file_name)
	    
	    expect(patient.valid?).to be_false
	    expect(patient.errors[:image_file_name].any?).to be_true
	  end
	end

	it "has many jobs" do
  		patient = Patient.new(patient_attributes)

 		 job1 = patient.jobs.new(job_attributes)
 		 job2 = patient.jobs.new(job_attributes)

 		 expect(patient.jobs).to include(job1)
		 expect(patient.jobs).to include(job2)
	end

	it "deletes associated jobs" do
  	  	patient = Patient.create(patient_attributes)
	    patient.jobs.create(job_attributes)
  		expect { 
    		patient.destroy
  		}.to change(Patient, :count).by(-1)
	end
#	it "accepts any rating that is in an approved list" do
#	  ratings = %w[G PG PG-13 R NC-17]
#	  ratings.each do |rating|
#	    patient = Patient.new(rating: rating)	    
#	    expect(patient.valid?).to be_false
#	    expect(patient.errors[:rating].any?).to be_false
#	  end
#	end

#	it "rejects any rating that is not in the approved list" do
#	  ratings = %w[R-13 R-16 R-18 R-21]
#	  ratings.each do |rating|
#	    patient = Patient.new(rating: rating)
	    
#	    expect(patient.valid?).to be_false
#	    expect(patient.errors[:rating].any?).to be_true
#	  end
#	end

#	it "is valid with example attributes" do
#	  patient = Patient.new(patient_attributes)
#	  
#	  expect(patient.valid?).to be_true
#	end
end