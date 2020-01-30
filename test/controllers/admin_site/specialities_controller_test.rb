require 'test_helper'

class AdminSite::SpecialitiesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admin_site_specialities_index_url
    assert_response :success
  end

  test "should get new" do
    get admin_site_specialities_new_url
    assert_response :success
  end

  test "should get create" do
    get admin_site_specialities_create_url
    assert_response :success
  end

  test "should get edit" do
    get admin_site_specialities_edit_url
    assert_response :success
  end

  test "should get update" do
    get admin_site_specialities_update_url
    assert_response :success
  end

  test "should get show" do
    get admin_site_specialities_show_url
    assert_response :success
  end

  test "should get destroy" do
    get admin_site_specialities_destroy_url
    assert_response :success
  end

end
