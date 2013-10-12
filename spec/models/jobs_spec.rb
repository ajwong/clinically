require 'spec_helper'

describe "A job" do
	it "belongs to a patient" do
		patient = Patient.create(patient_attributes)
		job = patient.jobs.new(job_attributes)
		expect(job.patient).to eq(patient)
	end
	it "with example attributes is valid" do
		job = Job.new(job_attributes)
		expect(job.valid?).to be_true
	end
	it "requires a category" do
		job = Job.new(category: "")
		expect(job.valid?).to be_false
		expect(job.errors[:category].any?).to be_true
	end
end