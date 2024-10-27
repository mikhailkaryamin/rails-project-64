# frozen_string_literal: true

module Posts
  class LikesController < ApplicationController
    before_action :set_post, only: %i[create destroy]
    before_action :find_like, only: %i[destroy]
    before_action :authenticate_user!, only: %i[create destroy]

    def create
      if already_liked?
        flash[:notice] = t('likes.error.more_than_one')
      else
        @post_like = @post.likes.build(user_id: current_user.id)
        @post_like.save
        redirect_back_or_to post_path(@post)
      end
    end

    def destroy
      if already_liked?
        @post_like.destroy
        redirect_back_or_to post_path(@post)
      else
        flash[:notice] = t('likes.error.unlike')
      end
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
