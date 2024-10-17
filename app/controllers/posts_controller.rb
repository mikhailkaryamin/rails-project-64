class PostsController < ApplicationController
  def show
    @post = Post.find_by title: params[:search][:title]
  end
end
