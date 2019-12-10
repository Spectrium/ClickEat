require 'test_helper'

class ConnectionControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get connection_index_url
    assert_response :success
  end

end
