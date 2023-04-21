require "test_helper"

class RestaurantFlowTest < ActionDispatch::IntegrationTest
  def setup
    @user = users(:uservalid)
    login_as @user
  end
  
  test "Can see the home page" do
    get '/'
    assert_response :success, "Couldn't acces to home"
    assert_select "h1", "Pages#home", "wrong h1"
  end

  test "Can create a restaurant" do
    # get new_restaurant_url
    get "/restaurants/new"
    assert_response :success, "Couldn't go to new restaurant"
    assert_equal "new", @controller.action_name, "Wrong controller action"

    post "/restaurants", params: { restaurant: { name: "Can create", user_id: @user.id }}
    assert_equal "create", @controller.action_name, "Wrong controller action"
    assert_equal Restaurant.last.name, "Can create"
    assert_response :redirect, "Couldn't recdirect after create restaurant"
    follow_redirect!
    assert_response :success, "Couldn't follow the redirection"
    assert_select "h1", "Can create"
  end
end
