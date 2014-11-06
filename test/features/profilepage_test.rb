require 'test_helper'

class ProfilepageTest < ActiveSupport::TestCase
	# test "the truth" do
	#   assert true
	# end
	test "at page" do
		visit("/")
		expect(page).to have_content('Listing profiles')
	end



end