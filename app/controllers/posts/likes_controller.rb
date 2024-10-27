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

        if @post_like.save
          redirect_to post_path(@post)
        else
          redirect_to post_path(@post), status: :unprocessable_entity
        end

      end
    end

    def destroy
      if already_liked?
        @post_like.destroy
      else
        flash[:notice] = t('likes.error.unlike')
      end
      redirect_to post_path(@post)
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
