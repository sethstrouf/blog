require 'test_helper'

class PostsControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  setup do
    @post = posts(:one)
    @admin =
      Admin.create(
        email: 'example@mail.com',
        password: 'foobar',
        password_confirmation: 'foobar'
      )
  end

  test 'should get index' do
    get posts_url
    assert_response :success
  end

  test 'should get new' do
    # non-admin user
    get new_post_url
    assert_response :redirect
    sign_in @admin
    get new_post_url
    assert_response :success
  end

  test 'should create post' do
    # non-admin user
    get new_post_url
    assert_response :redirect
    sign_in @admin
    assert_difference('Post.count') do
      post posts_url,
           params: {
             post: {
               body: @post.body,
               summary: @post.summary,
               title: @post.title
             }
           }
    end

    assert_redirected_to post_url(Post.last)
  end

  test 'should show post' do
    get post_url(@post)
    assert_response :success
  end

  test 'should get edit' do
    # non-admin user
    get new_post_url
    assert_response :redirect
    sign_in @admin
    get edit_post_url(@post)
    assert_response :success
  end

  test 'should update post' do
    # non-admin user
    get new_post_url
    assert_response :redirect
    sign_in @admin
    patch post_url(@post),
          params: {
            post: {
              body: @post.body,
              summary: @post.summary,
              title: @post.title
            }
          }
    assert_redirected_to post_url(@post)
  end

  test 'should destroy post' do
    # non-admin user
    get new_post_url
    assert_response :redirect
    sign_in @admin
    assert_difference('Post.count', -1) { delete post_url(@post) }

    assert_redirected_to posts_url
  end
end
