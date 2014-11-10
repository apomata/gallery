require 'test_helper'
class ProjectShowTest < ActionDispatch::IntegrationTest

  Capybara.configure do |config|
    config.run_server = false
    config.default_driver = :selenium
    config.app_host = 'localhost:3000' # change url
  end

  test "has description area" do
    visit(project_path(1))
    assert page.has_content?('Description')
  end

  test "has creators area" do
    visit(project_path(1))
    assert page.has_content?('Creators')
  end

  test "has other projects area" do
    visit(project_path(1))
    assert page.has_content?("Other projects by the creators")
  end
  test "has special links area" do
    visit(project_path(1))
    assert page.has_content?("Special Links")
  end







end