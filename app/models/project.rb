class Project < ActiveRecord::Base

	#for paper clip
	has_attached_file :paperclippicture, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
	validates_attachment_content_type :paperclippicture, :content_type => /\Aimage\/.*\Z/
end
