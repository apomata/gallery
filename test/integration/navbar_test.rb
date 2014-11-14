require 'test_helper'
class NavbarTest < ActionDispatch::IntegrationTest

  Capybara.configure do |config|
    config.run_server = false
    config.default_driver = :selenium
    config.app_host = 'localhost:3000' # change url
  end

  test "at page" do
    visit(projects_path)
    assert page.has_content?('Listing projects')
  end

  test "navbar profiles link works" do
  	visit(projects_path)
  	click_link('Profiles')
  	#so page loads?
  	page.has_content?('Listing profiles')
  	assert current_path == profiles_path
  end

  test "navbar projects link works" do
  	visit(projects_path)
  	click_link('Projects')
  	#so page loads?
  	page.has_content?('Listing projects')
  	assert current_path == projects_path
  end

  test "navbar new project link reject if not logged in" do
  	visit(projects_path)
  	click_link('New project')
  	#so page loads?
  	page.driver.browser.switch_to.alert.accept
  	page.has_content?('Listing projects')
  	assert current_path == projects_path
  end

  #not sure why but the logging in doesnt work here when I visit test
  test "navbar new project link works if logged in" do
  	visit("/test/Ford")
  	page.has_content?('Listing profiles')
  	visit(projects_path)
  	click_link('New project')
  	#throw a get witha a hash with the params needed to fake user
  	#so page loads?
  	page.has_content?('New Project')
  	assert current_path == new_project_path
  end



end