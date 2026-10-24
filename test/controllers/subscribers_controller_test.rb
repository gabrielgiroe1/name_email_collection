require "test_helper"

class SubscribersControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get subscribers_new_url
    assert_response :success
  end

  test "should get thank_you" do
    get subscribers_thank_you_url
    assert_response :success
  end

  test "should get create" do
    get subscribers_create_url
    assert_response :success
  end
end
