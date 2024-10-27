# frozen_string_literal: true

require 'application_system_test_case'

class LikesTest < ApplicationSystemTestCase
  include Devise::Test::IntegrationHelpers

  setup do
    @post = posts(:one)
  end

  test 'should add like' do
    sign_in users(:two)

    visit post_url(@post)

    assert_selector "#count-like-#{@post.id}", text: '1'

    click_on "like-#{@post.id}"

    assert_selector "#count-like-#{@post.id}", text: '2'
  end

  test 'should destroy like' do
    sign_in users(:one)

    visit post_url(@post)

    assert_selector "#count-like-#{@post.id}", text: '1'

    click_on "like-#{@post.id}"

    assert_selector "#count-like-#{@post.id}", text: '0'
  end
end
