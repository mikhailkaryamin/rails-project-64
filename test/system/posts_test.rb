require "application_system_test_case"

class PostsTest < ApplicationSystemTestCase
  include Devise::Test::IntegrationHelpers

  setup do
    @post = posts(:one)
  end

  test "visiting the index" do
    visit posts_url
    assert_selector "h1", text: "Posts"
  end

  test "should create post" do
    sign_in users(:one)

    visit posts_url
    click_on "New post"

    fill_in "Текст поста", with: @post.body
    select("Category1", from: "Категория")
    fill_in "form_header_test_id", with: @post.title
    click_on "Опубликовать пост"

    assert_text "Post was successfully created"
  end
end
