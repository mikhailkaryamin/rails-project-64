# frozen_string_literal: true

require 'application_system_test_case'

class CommentsTest < ApplicationSystemTestCase
  include Devise::Test::IntegrationHelpers

  setup do
    @comment = post_comments(:one)
    @post = posts(:one)
    @post.comments << @comment
    @post.save!
  end

  test 'visiting the index' do
    visit post_url(@post)
    assert_selector "#comment-#{@comment.id}", text: @comment.content
  end

  test 'should create comment' do
    sign_in users(:one)

    visit post_url(@post)

    fill_in 'post_comment_content', with: @comment.content
    click_on 'Оставить комментарий'

    assert_text 'Comment was successfully created'
  end
end
