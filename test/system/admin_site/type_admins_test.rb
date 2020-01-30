require "application_system_test_case"

class AdminSite::TypeAdminsTest < ApplicationSystemTestCase
  setup do
    @admin_site_type_admin = admin_site_type_admins(:one)
  end

  test "visiting the index" do
    visit admin_site_type_admins_url
    assert_selector "h1", text: "Admin Site/Type Admins"
  end

  test "creating a Type admin" do
    visit admin_site_type_admins_url
    click_on "New Admin Site/Type Admin"

    fill_in "Name", with: @admin_site_type_admin.name
    click_on "Create Type admin"

    assert_text "Type admin was successfully created"
    click_on "Back"
  end

  test "updating a Type admin" do
    visit admin_site_type_admins_url
    click_on "Edit", match: :first

    fill_in "Name", with: @admin_site_type_admin.name
    click_on "Update Type admin"

    assert_text "Type admin was successfully updated"
    click_on "Back"
  end

  test "destroying a Type admin" do
    visit admin_site_type_admins_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Type admin was successfully destroyed"
  end
end
