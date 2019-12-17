require 'test_helper'

class RestaurantsSpecialitiesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get restaurants_specialities_index_url
    assert_response :success
  end

  test "should get new" do
    get restaurants_specialities_new_url
    assert_response :success
  end

  test "should get create" do
    get restaurants_specialities_create_url
    assert_response :success
  end

  test "should get edit" do
    get restaurants_specialities_edit_url
    assert_response :success
  end

  test "should get update" do
    get restaurants_specialities_update_url
    assert_response :success
  end

end
