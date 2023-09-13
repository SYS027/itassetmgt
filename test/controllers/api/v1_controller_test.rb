require "test_helper"

class Api::V1ControllerTest < ActionDispatch::IntegrationTest
  test "should get Departments" do
    get api_v1_Departments_url
    assert_response :success
  end
end
