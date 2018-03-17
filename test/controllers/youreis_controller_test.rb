require 'test_helper'

class YoureisControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get youreis_create_url
    assert_response :success
  end

  test "should get destroy" do
    get youreis_destroy_url
    assert_response :success
  end

end
