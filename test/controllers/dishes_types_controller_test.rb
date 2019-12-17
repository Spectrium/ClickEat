require 'test_helper'

class DishesTypesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get dishes_types_index_url
    assert_response :success
  end

  test "should get new" do
    get dishes_types_new_url
    assert_response :success
  end

  test "should get create" do
    get dishes_types_create_url
    assert_response :success
  end

  test "should get edit" do
    get dishes_types_edit_url
    assert_response :success
  end

  test "should get update" do
    get dishes_types_update_url
    assert_response :success
  end

end
