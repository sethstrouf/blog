require 'test_helper'

class PostTest < ActiveSupport::TestCase
  test 'title cannot be blank' do
    post = Post.create(title: '', summary: 'Summary here', body: 'Body here')
    assert post.invalid?
  end

  test 'summary cannot be blank' do
    post = Post.create(title: 'Title here', summary: '', body: 'Body here')
    assert post.invalid?
  end

  test 'body cannot be blank' do
    post = Post.create(title: 'Title here', summary: 'Summary here', body: '')
    assert post.invalid?
  end

  test 'posts can create comments' do
    comment = posts(:one).comments.create(name: 'seth', body: 'hi')
    assert comment.valid?
  end
end
