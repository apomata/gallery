class Project < ActiveRecord::Base
	has_many :userprojects, dependent: :destroy
	has_many :projectpictures, dependent: :destroy
	#if no users project should desrtoy not sure how of if want to do this
	has_many :profiles, through: :userprojects

	validates :title, presence: true, length: { maximum: 25 }
	#for paper clip
	#has_attached_file :paperclippicture, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
	#validates_attachment_content_type :paperclippicture, :content_type => /\Aimage\/.*\Z/


end
