# frozen_string_literal: true

module Posts
  class LikesController < ApplicationController
    before_action :set_post, only: %i[create destroy]
    before_action :find_like, only: %i[destroy]
    before_action :authenticate_user!, only: %i[create destroy]

    def create
      unless already_liked?
        @post_like = @post.likes.build(user_id: current_user.id)

        @post_like.save
      end

      redirect_back_or_to post_path(@post)
    end

    def destroy
      already_liked? && @post_like.destroy

      redirect_back_or_to post_path(@post)
    end

    private

    def set_post
      @post = Post.find(params[:post_id])
    end

    def already_liked?
      PostLike.exists?(user_id: current_user.id, post_id: params[:post_id])
    end

    def find_like
      @post_like = @post.likes.find(params[:id])
    end
  end
end
