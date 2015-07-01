class CommentsController < ApplicationController

  def new
    @post = Post.find(params[:post_id])
    @comment = Comment.new
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
