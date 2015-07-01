class BattlesController < ApplicationController

  def random_post
    Post.offset(rand(Post.count)).first
  end

  def index
    @post1 = random_post
    @post2 = random_post
    until @post2 != @post1
      @post2 = random_post
    end
  end

  def update

    winning_post = Post.find(params[:winning_post_id])
    losing_post = Post.find(params[:losing_post_id])

    winning_post.update(wins: winning_post.wins + 1)
    losing_post.update(losses: winning_post.losses + 1)

  end

end
