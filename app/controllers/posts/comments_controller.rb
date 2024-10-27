module Posts
  class CommentsController < ApplicationController
    before_action :set_post, only: %i[ index create ]
    before_action :authenticate_user!, only: %i[ create ]

    def index
      @post_comments = @post.comments
    end

    def new
      @post_comment = Comment.new(parent_id: post_comment_params[:parent_id])
    end

    def create
      @post_comment = @post.comments.build(post_comment_params)
      @post_comment.user = current_user

      if @post_comment.save
        redirect_to post_path(@post), notice: "Comment was successfully created."
      else
        redirect_to post_path(@post), status: :unprocessable_entity
      end
    end

    private
      def set_post
        @post = Post.find(params[:post_id])
      end

      def post_comment_params
        params.require(:post_comment).permit(:content, :parent_id)
      end
  end
end
