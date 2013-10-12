module PatientsHelper
	def format_patient_name(patient)
		patient.last_name.upcase + ", " + patient.given_name
	end
	def image_for(patient)
		if patient.image_file_name.blank?
			image_tag("placeholder.png")
		else
			image_tag(patient.image_file_name)
		end
	end
end
