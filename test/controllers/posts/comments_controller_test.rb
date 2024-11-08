# frozen_string_literal: true

require 'test_helper'

class CommentsControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  setup do
    @comment = post_comments(:one)
    @post = posts(:one)
  end

  test 'should create comment' do
    sign_in users(:one)
    post post_comments_url(@post), params: {
      post_comment: {
        content: @comment.content,
        parent_id: @comment.parent_id
      }
    }

    assert_response :redirect

    created_comment =
      PostComment.find_by(
        content: @comment.content
      )

    assert(created_comment)
  end
end
