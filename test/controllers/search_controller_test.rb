require 'test_helper'

class SearchControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get search_index_url
    assert_response :success
  end

  test "should get live_search" do
    get search_live_search_url
    assert_response :success
  end

end
