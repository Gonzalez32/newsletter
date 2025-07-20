require "test_helper"

class WeeklyNewslettersControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get weekly_newsletters_index_url
    assert_response :success
  end

  test "should get show" do
    get weekly_newsletters_show_url
    assert_response :success
  end
end
