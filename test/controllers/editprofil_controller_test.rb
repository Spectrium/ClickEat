require 'test_helper'

class EditprofilControllerTest < ActionDispatch::IntegrationTest
  test "should get edit" do
    get editprofil_edit_url
    assert_response :success
  end

end
