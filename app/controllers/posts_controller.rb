class PostsController < ApplicationController
  def index
    # @user = User.find(params[:user_id])
    # @posts = Post.where(post: @user).order(id: :asc)
    @post = Post.find(params[:user_id])
  end

  def show
    @post = Post.find(params[:id])
    @user = Post.find(params[:user_id])

    # @user = User.find(params[:user_id])
    # @post = Post.where(author: @user)
    # @post = params[:post_id]
  end
end
