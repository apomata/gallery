require 'test_helper'
class ProjectIndexTest < ActionDispatch::IntegrationTest

  Capybara.configure do |config|
    config.run_server = false
    config.default_driver = :selenium
    config.app_host = 'localhost:3000' # change url
  end

  test "at page" do
    visit(projects_path)
    assert page.has_content?('Listing projects')
  end
end