class Projectpicture < ActiveRecord::Base
	belongs_to :project

	#for paperclip
	has_attached_file :picture, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/default_photo.png"
  	#validates_attachment_content_type :picture, :content_type => /\Aimage\/.*\Z/
  	#validates_attachment_presence :picture
  	#validates_attachment :picture, presence: true
  	validates_attachment_file_name :picture, :matches => [/jpe?g\z/, /gif\z/, /png\z/]

end
