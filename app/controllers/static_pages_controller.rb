class StaticPagesController < ApplicationController
  def home
  	@post = current_user.posts.build if signed_in?
    if(signed_in?)
  	   @feed_items = current_user.feed.paginate(page: params[:page]) 
    else
      @recent_posts = Post.find(:all, :limit => 3)
    end
  end

  def help
  end

  def about
  end

  def contact
  end
end

