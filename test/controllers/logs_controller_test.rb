require 'test_helper'

class LogsControllerTest < ActionDispatch::IntegrationTest
  test "should get user_id:integer" do
    get logs_user_id:integer_url
    assert_response :success
  end

  test "should get description:string" do
    get logs_description:string_url
    assert_response :success
  end

end
