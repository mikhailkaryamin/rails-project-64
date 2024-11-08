# frozen_string_literal: true

class PostsController < ApplicationController
  before_action :set_post, only: %i[show]
  before_action :authenticate_user!, only: %i[create]

  def index
    @posts = Post.includes(:category, :creator)
  end

  def show
    @comment = PostComment.new
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.creator = current_user

    if @post.save
      redirect_to @post, notice: t('posts.success_notice')
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def set_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:body, :title, :category_id)
  end
end
