require 'test_helper'
require 'capybara/rails'
require 'capybara/minitest'

class UserFlowsTest < ActionDispatch::IntegrationTest
  include Capybara::DSL
  include Capybara::Minitest::Assertions

  fixtures :all

  test 'go to homepage and search events' do
    # going to homepage
    visit root_path
    assert_selector "h2", text: "AstroNight"
    assert_selector "input", id: "searchform_address"

    within 'form' do
      fill_in("searchform_address", with: 'Lyon', visible: false)
      select("200 km", from: "searchform_radius", visible: false)
      choose("searchform_date_range_7_prochains_jours", visible: false)
      click_button 'Go!'
    end

    assert_selector "h3", text: "AstroNight analyse les conditions d'observation"
  end

  # reset sessions and driver between tests
  teardown do
    Capybara.reset_sessions!
    Capybara.use_default_driver
  end
end
