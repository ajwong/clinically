class Job < ActiveRecord::Base
  validates :category, :description, :deadline_at, presence: true
  
  CATEGORIES = ["Pathology","Radiology","Audit"]
  validates :category, inclusion: {
  	in: CATEGORIES,
  	message: "must be from Valid"
  }
  belongs_to :patient

end
