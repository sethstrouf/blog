require "test_helper"

class StaticPagesControllerTest < ActionDispatch::IntegrationTest
  
  def setup
    @base_title = " | Hannah Bauer"
  end
  
  test "should get hello" do
    get hello_url
    assert_response :success
    assert_select "title", "Hello" + @base_title
  end

  test "should get about" do
    get about_url
    assert_response :success
    assert_select "title", "About" + @base_title
  end

  test "should get work" do
    get work_url
    assert_response :success
    assert_select "title", "Work" + @base_title
  end

end
