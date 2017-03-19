require 'test_helper'

class UserProfileControllerTest < ActionDispatch::IntegrationTest
  test "should get username:string" do
    get user_profile_username:string_url
    assert_response :success
  end

  test "should get first_name:string" do
    get user_profile_first_name:string_url
    assert_response :success
  end

  test "should get middle_name:string" do
    get user_profile_middle_name:string_url
    assert_response :success
  end

  test "should get last_name:string" do
    get user_profile_last_name:string_url
    assert_response :success
  end

  test "should get user_id:integer" do
    get user_profile_user_id:integer_url
    assert_response :success
  end

end
