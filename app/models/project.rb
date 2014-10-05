class Project < ActiveRecord::Base
	has_many :userprojects
	has_many :profiles, through: :userprojects

	#for paper clip
	#has_attached_file :paperclippicture, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
	#validates_attachment_content_type :paperclippicture, :content_type => /\Aimage\/.*\Z/


end
