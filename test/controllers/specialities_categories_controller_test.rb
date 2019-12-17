require 'test_helper'

class SpecialitiesCategoriesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get specialities_categories_index_url
    assert_response :success
  end

  test "should get new" do
    get specialities_categories_new_url
    assert_response :success
  end

  test "should get create" do
    get specialities_categories_create_url
    assert_response :success
  end

  test "should get edit" do
    get specialities_categories_edit_url
    assert_response :success
  end

  test "should get update" do
    get specialities_categories_update_url
    assert_response :success
  end

end
