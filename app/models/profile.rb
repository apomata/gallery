class Profile < ActiveRecord::Base
	has_many :userprojects
	has_many :projects, through: :userprojects
	# callbacks
	before_save { email.downcase! if !email.nil?}

	validates :first_name, presence: true, length: { maximum: 25 }
	validates :last_name, presence: true, length: { maximum: 25 }
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(?:\.[a-z\d\-]+)*\.[a-z]+\z/i
	#validates :email, format: { with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false }

	#for paperclip
	has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
  	validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/

#for oauth

  	#def self.from_omniauth(auth)
	#	where(auth.slice("provider", "uid")).first || create_from_omniauth(auth)
	#end

	def self.from_fakeuser(firstname)
		auth = { "provider" => "Test", "uid" => 0,
			"info" => {"firstname" => firstname, 'lastname' => 'Von Lastname', }}
		#this where may need to change
		where(first_name: firstname).first || create_from_omniauth(auth)
	end

	def self.create_from_omniauth(auth)
		create! do |profile|
			#provider should be just brandeis so I shouldnt need
			#profile.provider = auth["provider"]
			profile.uid = auth["uid"]
			profile.first_name = auth["info"]["firstname"]
			profile.last_name = auth["info"]["lastname"]
			profile.email = auth["info"]["email"]

 		end
 		#will haved to add other fields
	end


	# returns a users full name
	def full_name
		"#{first_name} #{last_name}"
	end
end
