require "test_helper"

class CommentsControllerTest < ActionDispatch::IntegrationTest
  
  test "get comments show path" do
    get comment_path(comments(:has_name))
    assert :success
  end
end
