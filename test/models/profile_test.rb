require 'test_helper'

class ProfileTest < ActiveSupport::TestCase
	# test "the truth" do
	#   assert true
	# end
	test "does not save without first name" do
		p = Profile.new(last_name: "last")
		assert_not p.save(), "saved without first name"
	end

	test "does not save without last name" do
		p = Profile.new(first_name: "first")
		assert_not p.save(), "saved without last name"
	end

	test "save with both names" do
		p = Profile.new(first_name: "first", last_name: "last")
		assert p.save(), "did not save with first and last name"
	end

	test "save with both names and bio" do
		p = Profile.new(first_name: "first", last_name: "last", bio: "here is a bio as adasd asd asd asd asd asd asd asd asd asd asd asd asd asd asd asd asd asd asd")
		assert p.save(), "did not save with bio"
	end

	test "save with both names correct email" do
		p = Profile.new(first_name: "first", last_name: "last", email: "fa_ke123@fake.com")
		assert p.save(), "did not save with correct email"
	end

	#dont validate email since it should come from shiboleth
	#test " does not save with both names incorrect email" do
	#	p = Profile.new(first_name: "first", last_name: "last", email: "fa_ke123fake.com")
	#	assert_not p.save(), "saved with incorrect email"
	#end





end
