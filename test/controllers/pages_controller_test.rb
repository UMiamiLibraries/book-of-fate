require 'test_helper'

class PagesControllerTest < ActionDispatch::IntegrationTest
  test "should get tag_pages" do
    get pages_tag_pages_url
    assert_response :success
  end

end
