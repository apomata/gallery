require 'test_helper'
class ProjectShowTest < ActionDispatch::IntegrationTest

  Capybara.configure do |config|
    config.run_server = false
    config.default_driver = :selenium
    config.app_host = 'localhost:3000' # change url
  end

  test "has bio area" do
    visit(profile_path(1))
    assert page.has_content?('Bio')
  end

  test "has collaborators area" do
    visit(profile_path(1))
    assert page.has_content?('Collaborators')
  end

  test "has projects area" do
    visit(profile_path(1))
    assert page.has_content?("Projects")
  end
  test "has contact info  area" do
    visit(profile_path(1))
    assert page.has_content?("Contact Info")
  end







end