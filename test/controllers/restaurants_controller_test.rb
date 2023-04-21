require "test_helper"

class RestaurantsControllerTest < ActionDispatch::IntegrationTest
  
  def setup
    @user = users(:uservalid)
    login_as @user
  end

  test "should get new" do
    get new_restaurant_url
    assert_response :success
  end
end
