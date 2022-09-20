class PostsController < ApplicationController
  def show
    @user = params[:user_id]
    @post = params[:post_id]
  end

  def index
    @user = params[:user_id]
  end
end
