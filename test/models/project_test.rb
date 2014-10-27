require 'test_helper'

class ProjectTest < ActiveSupport::TestCase
	# test "the truth" do
	#   assert true
	# end

	test "should not save without title" do
		p = Project.new(title: '')
		assert_not p.save, "saved project without title"
	end
	test "should save with only title" do
		p = Project.new(title: "title")
		assert p.save, "did not save with only title"
	end
	test "should not save with title longer than 25 characters" do
		p = Project.new(title: "title should be less that twenty five characters")
		assert_not p.save, "safed a title with over 25 characters"
	end
	test "save with embed code" do
		p = Project.new(title: "title", embedcode: '<iframe width="420" height="315" src="//www.youtube.com/embed/siwpn14IE7E" frameborder="0" allowfullscreen></iframe>')
		assert p.save, "embed code did not save"
	end
	test "save with description" do
		p = Project.new(title: "title", description: "asdadf asdf asdf asdfasdf asdf asf sdfasdf asd fasdf asdfasdf sdf saddf asdf asdf asdf asdf asdf asdf sd fasdf asdf asdf asdf asdf ")
		assert p.save(), "did not save with description"
	end
	test "delete elements" do
		p = Project.new(title: 'title', description: 'description',
		 embedcode: '<iframe width="420" height="315" src="//www.youtube.com/embed/siwpn14IE7E" frameborder="0" allowfullscreen></iframe>',
		 )
		p.save
		assert p.description.delete ""
	end


end
