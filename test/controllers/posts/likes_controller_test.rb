# frozen_string_literal: true

require 'test_helper'

class Posts::LikesControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  setup do
    @post = posts(:one)
    @post_like = post_likes(:one)
  end

  test 'should add like' do
    sign_in users(:two)

    post post_likes_url(@post)

    assert_response :redirect

    @post.likes.find_by(
      user: users(:two)
    )
  end

  test 'should destroy like' do
    sign_in users(:one)

    delete post_like_url(@post, @post_like)

    assert { !PostLike.exists?(@post_like.id) }

    assert_redirected_to post_path(@post)
  end
end
