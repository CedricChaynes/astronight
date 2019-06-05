require 'test_helper'

class EventMaterialsControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get event_materials_create_url
    assert_response :success
  end

end
