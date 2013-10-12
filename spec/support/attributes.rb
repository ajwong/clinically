def patient_attributes(overrides = {})
  {
	last_name: "Doe",
    given_name: "John",
    born_on: "1970-12-30",
    sex: "M",
    uri: "123456",
    image_file_name: "johndoe.png",
    description: "Well man"
  }.merge(overrides)
end

def job_attributes(overrides = {})
  {
	category: "Pathology",
    description: "Chase FBE UEC LFTs",
    deadline_at: DateTime.new
  }.merge(overrides)
end