require 'test_helper'

class AdminSite::CategoryDishesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admin_site_category_dishes_index_url
    assert_response :success
  end

  test "should get new" do
    get admin_site_category_dishes_new_url
    assert_response :success
  end

  test "should get create" do
    get admin_site_category_dishes_create_url
    assert_response :success
  end

  test "should get edit" do
    get admin_site_category_dishes_edit_url
    assert_response :success
  end

  test "should get update" do
    get admin_site_category_dishes_update_url
    assert_response :success
  end

  test "should get destroy" do
    get admin_site_category_dishes_destroy_url
    assert_response :success
  end

  test "should get show" do
    get admin_site_category_dishes_show_url
    assert_response :success
  end

end
