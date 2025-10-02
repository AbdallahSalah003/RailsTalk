require "test_helper"

class DashboardControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    user = users(:one)  
    sign_in user
    get root_path
    assert_response :success
  end
end
