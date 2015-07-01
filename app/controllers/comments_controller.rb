class CommentsController < ApplicationController

  def new
    @post = Post.find(params[:post_id])
    @comment = Comment.new
  end

  def edit
    @comment = Comment.find(params[:id])
    @post = Post.find(params[:post_id])

  end

  def update
    @comment = Comment.find(params[:id])
    if @comment.update(comment_params)
      flash[:alert] = "Praises modified"
      redirect_to post_path(@comment.post)
    else
      render :edit
    end
  end

  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.new(comment_params)
    if @comment.save
    user = User.find(@comment.user_id)
    user.comments.push(@comment)

      flash[:alert] = "Ghost Rider begrudingly approves of your statement."
      redirect_to post_path(@post)
    else
      render :new
    end
  end

  private
    def comment_params
      params.require(:comment).permit(:body, :post_id, :user_id)
    end

end
