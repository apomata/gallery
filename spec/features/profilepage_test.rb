require 'test_helper'

class ProfilepageTest < ActiveSupport::TestCase
	# test "the truth" do
	#   assert true
	# end
	test "at page" do
		visit(profiles_path)
		puts "############################################################################################################"
		expect(page).to have_content('im confused')
	end



end