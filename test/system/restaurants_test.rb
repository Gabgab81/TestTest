require "application_system_test_case"

class RestaurantsTest < ApplicationSystemTestCase
  test "visiting the index" do
    visit root_url
  
    # assert_selector "h1", text: "Restaurant"²
  end
end
