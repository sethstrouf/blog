require "test_helper"

class CommentTest < ActiveSupport::TestCase
  
  test "body should be present" do
    comment = Comment.new(name: "seth", body: "")
    assert comment.invalid?
  end
  
end
