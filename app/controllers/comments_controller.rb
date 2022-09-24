class CommnentsController
  # def new
  #   @user = current_user
  #   @post = Post.find(params[:id])
  #   @comment = Comment.new
  # end

  def create
    @user = current_user
    @post = Post.find(params[:post_id])
    @comment = Comment.new(params.require(:comment).permit(:text, :author, :post))
    @comment.author = @user
    @comment.post = @post
    if @comment.save
      flash[:success] = 'Saved successfully'
      redirect_to user_posts_path(@author, @post)
    else
      flash.now[:error] = 'FAiled to save comment'
      render :new, status: 422
    end
  end
end
