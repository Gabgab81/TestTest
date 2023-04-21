require "test_helper"

class RestaurantTest < ActiveSupport::TestCase

  def setup
    @user = users(:uservalid)
    # @restaurant = Restaurant.new(name: "McDo", user_id: @user.id)
    # @restaurant = restaurants(:restaurantvalid)
    @restaurant = restaurants.second
  end

  test "the truth" do
    assert @restaurant.valid?, "#{@restaurant.name}: #{@restaurant.errors.messages}}"
  end

  test "name should be present" do
    @restaurant.name = ""
    assert_not @restaurant.valid?
  end

  test "user_id should be present" do
    @restaurant.user = nil
    assert_not @restaurant.valid?, 'Valided the restaurant without the user_id'
  end

  test "Should not save without name" do
    restaurant = Restaurant.new(user_id: @user.id)
    assert_not restaurant.save, "Saved the restaurant without a name"
  end



end

