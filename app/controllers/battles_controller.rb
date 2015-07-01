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

end
