require "test_helper"

class Api::V1::ProducttypeControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get api_v1_producttype_index_url
    assert_response :success
  end
end
