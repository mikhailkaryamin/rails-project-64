require "test_helper"

class Posts::LikesControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  setup do
    @post = posts(:one)
  end

  test "should create comment" do
    sign_in users(:one)

    assert_difference("LikePost.count") do
      post post_likes_url(@post)
    end

    assert_redirected_to post_path(LikePost.last.post)
  end
end
