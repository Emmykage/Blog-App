class PostsController < ApplicationController
  def index
    # @user = User.find(params[:user_id])
    # @posts = Post.where(post: @user).order(id: :asc)
    # @post = Post.find(params[:user_id])

    @user = User.find(params[:user_id])
    @posts = @user.posts
  end

  def show
    @post = Post.find(params[:id])

    # @user = Post.find(params[:user_id])
    # @user = User.find(params[:user_id])
    # @post = Post.where(author: @user)
    # @post = params[:post_id]
  end

  def new
    @post = Post.new
    @user = current_user
  end

  def create
    @author = current_user
    @post = Post.new(params.require(:post).permit(:comments_counter, :likes_counter, :author, :title, :text))
    @post.likes_counter = 0
    @post.comments_counter = 0
    @post.author = @author

    respond_to do |format|
      format.html do
        if @post.save
          flash[:success] = 'post succesfully saved'
          redirect_to user_posts_url
        else
          flash.now[:error] = 'Failed to save code'
          render :new, locals: { post: }
        end
      end
    end
  end
end
