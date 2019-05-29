require 'test_helper'

class AstronomicalEventsControllerTest < ActionDispatch::IntegrationTest
  test "should get shiw" do
    get astronomical_events_shiw_url
    assert_response :success
  end

end
