class LikesController < ApplicationController
  def create
    @user = current_user
    @post = Post.find(params[:post_id])
    @like = Like.new(params.permit(:author, :post))
    @likes.author = @user
    @like.post = @post

    if @like.saved
      flash[:success] = 'Liked'
      redirect_to user_post_path(@post.author, @post)
    else
      flash.now[:error] = 'Error: Like failed'
    end
  end
end
