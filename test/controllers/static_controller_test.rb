require 'test_helper'

class StaticControllerTest < ActionDispatch::IntegrationTest
  test "should get contact" do
    get static_contact_url
    assert_response :success
  end

  test "should get about" do
    get static_about_url
    assert_response :success
  end

  test "should get pages" do
    get static_pages_url
    assert_response :success
  end

end
