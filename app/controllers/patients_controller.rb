class PatientsController < ApplicationController
	def index
		@patients = Patient.all.alphabetical
	end
	def show
		@patient = Patient.find(params[:id])
	end
	def edit
		@patient = Patient.find(params[:id])
	end
	def update
		@patient = Patient.find(params[:id])
		if @patient.update(patient_params)
			redirect_to @patient, notice: "Patient successfully updated!"
		else
			render :edit
		end
	end
	def new
		@patient = Patient.new
	end

	def create
		@patient = Patient.new(patient_params)
		if @patient.save(patient_params)
			redirect_to @patient, notice: "Patient successfully created!"
		else 
			render :new
		end
	end

	def destroy
		@patient = Patient.find(params[:id])
		@patient.destroy
		redirect_to patients_url, alert: "Patient successfully deleted!"
	end

	private

	def patient_params
		params.require(:patient).permit(:last_name, :given_name, :born_on, :description, :uri, :sex, :image_file_name)
	end
end
