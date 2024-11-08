# frozen_string_literal: true

require 'test_helper'

class PostsControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  setup do
    @post = posts(:one)
  end

  test 'should get index' do
    get posts_url
    assert_response :success
  end

  test 'should get new' do
    get new_post_url
    assert_response :success
  end

  test 'should create post' do
    sign_in users(:one)

    post posts_url, params: {
      post: {
        body: @post.body,
        category_id: @post.category_id,
        title: @post.title
      }
    }

    assert_response :redirect

    created_post =
      Post.find_by(
        body: @post.body,
        category_id: @post.category_id,
        title: @post.title
      )

    assert(created_post)
  end

  test 'should show post' do
    get post_url(@post)
    assert_response :success
  end
end
