class PostsController < ApplicationController
  def index
    @user = params[:user_id]
  end

  def show
    @user = params[:user_id]
    @post = params[:post_id]
  end
end
