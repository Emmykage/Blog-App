class LikesController < ApplicationController
  def create
    @user = current_user
    @post = Post.find(params[:post_id])
    @like = Like.new(params.permit(:author, :post))
    @like.author = @user
    @like.post = @post

    if @like.save
      flash[:success] = 'Liked'
      redirect_to user_post_path(@post.author, @post)
    else
      flash.now[:error] = 'Error: Like failed'
    end
  end
end
