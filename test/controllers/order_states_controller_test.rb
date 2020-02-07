require 'test_helper'

class OrderStatesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get order_states_index_url
    assert_response :success
  end

  test "should get edit" do
    get order_states_edit_url
    assert_response :success
  end

  test "should get update" do
    get order_states_update_url
    assert_response :success
  end

end
