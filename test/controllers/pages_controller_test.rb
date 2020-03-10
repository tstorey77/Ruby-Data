require 'test_helper'

class PagesControllerTest < ActionDispatch::IntegrationTest
  test "should get skip-assets" do
    get pages_skip-assets_url
    assert_response :success
  end

end
