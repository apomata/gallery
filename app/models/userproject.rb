class Userproject < ActiveRecord::Base
	belongs_to :profile
	belongs_to :project
end
