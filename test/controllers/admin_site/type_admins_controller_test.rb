require 'test_helper'

class AdminSite::TypeAdminsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @admin_site_type_admin = admin_site_type_admins(:one)
  end

  test "should get index" do
    get admin_site_type_admins_url
    assert_response :success
  end

  test "should get new" do
    get new_admin_site_type_admin_url
    assert_response :success
  end

  test "should create admin_site_type_admin" do
    assert_difference('AdminSite::TypeAdmin.count') do
      post admin_site_type_admins_url, params: { admin_site_type_admin: { name: @admin_site_type_admin.name } }
    end

    assert_redirected_to admin_site_type_admin_url(AdminSite::TypeAdmin.last)
  end

  test "should show admin_site_type_admin" do
    get admin_site_type_admin_url(@admin_site_type_admin)
    assert_response :success
  end

  test "should get edit" do
    get edit_admin_site_type_admin_url(@admin_site_type_admin)
    assert_response :success
  end

  test "should update admin_site_type_admin" do
    patch admin_site_type_admin_url(@admin_site_type_admin), params: { admin_site_type_admin: { name: @admin_site_type_admin.name } }
    assert_redirected_to admin_site_type_admin_url(@admin_site_type_admin)
  end

  test "should destroy admin_site_type_admin" do
    assert_difference('AdminSite::TypeAdmin.count', -1) do
      delete admin_site_type_admin_url(@admin_site_type_admin)
    end

    assert_redirected_to admin_site_type_admins_url
  end
end
