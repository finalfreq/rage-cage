class PostsController < ApplicationController

  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      flash[:alert] = "Change En-Caged."
      redirect_to post_path(@post)
    else
      render :edit
    end
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      flash[:alert] = "Tribute Accepted"
      redirect_to posts_path
    else
      render :new
    end
  end

  def show
    @post = Post.find(params[:id])
    total = @post.wins + @post.losses
    if total == 0
      @rating = 0
    else
      @rating = @post.wins / total
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to posts_path
  end

private
  def post_params
    params.require(:post).permit(:title, :image, :user_id, :description, :rating, :wins, :losses)
  end
end
