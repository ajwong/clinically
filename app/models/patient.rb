class Patient < ActiveRecord::Base
	validates :last_name, :given_name, :description, :born_on, :sex, :uri, presence: true
	validates :image_file_name, allow_blank: true, format: {
	  with:    /\w+.(gif|jpg|png)\z/i,
	  message: "must reference a GIF, JPG, or PNG image"
	}
	has_many :jobs, dependent: :destroy

	def self.elderly
		where("born_on <= ?", 65.years.ago).order('last_name asc')
	end
	def self.alphabetical
		order("last_name asc")
	end
end
