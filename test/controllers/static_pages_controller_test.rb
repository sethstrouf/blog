require "test_helper"

class StaticPagesControllerTest < ActionDispatch::IntegrationTest
  test "should get hello" do
    get static_pages_hello_url
    assert_response :success
  end

  test "should get about" do
    get static_pages_about_url
    assert_response :success
  end

  test "should get work" do
    get static_pages_work_url
    assert_response :success
  end

  test "should get contact" do
    get static_pages_contact_url
    assert_response :success
  end
end
