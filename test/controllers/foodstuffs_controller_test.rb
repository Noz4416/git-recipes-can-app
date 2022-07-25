require "test_helper"

class FoodstuffsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get foodstuffs_new_url
    assert_response :success
  end

  test "should get edit" do
    get foodstuffs_edit_url
    assert_response :success
  end
end
