require "test_helper"

class ProductcategoriesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get productcategories_index_url
    assert_response :success
  end

  test "should get create" do
    get productcategories_create_url
    assert_response :success
  end
end
