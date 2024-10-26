class PostsController < ApplicationController
  before_action :set_post, only: %i[ show ]
  before_action :authenticate_user!, only: %i[ create ]

  def index
    @posts = Post.all
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

    respond_to do |format|
      if @post.save
        format.html { redirect_to @post, notice: "Post was successfully created." }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
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
