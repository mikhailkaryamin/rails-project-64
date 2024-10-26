require "test_helper"

class CommentsControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  setup do
    @comment = post_comments(:one)
    @post = posts(:one)
  end

  test "should create comment" do
    sign_in users(:one)

    assert_difference("PostComment.count") do
      post post_comments_url(@post), params: { post_comment: { content: "text", parent_id: @post.id } }
    end

    assert_redirected_to post_path(PostComment.last.post)
  end
end
