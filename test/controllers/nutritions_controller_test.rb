require "test_helper"

class NutritionsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get nutritions_new_url
    assert_response :success
  end

  test "should get edit" do
    get nutritions_edit_url
    assert_response :success
  end
end
