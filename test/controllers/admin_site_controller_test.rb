require 'test_helper'

class AdminSiteControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admin_site_index_url
    assert_response :success
  end

end
