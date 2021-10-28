require "test_helper"

class CommentTest < ActiveSupport::TestCase
  
  test "body should be present" do
    comment = posts(:one).comments.create(name: "seth", body: "")
    assert comment.invalid?
  end

  test "body should not have more than 140 characters" do
    body = "a" * 141
    comment = posts(:one).comments.create(name: "seth", body: body)
    assert comment.invalid?
  end

end
