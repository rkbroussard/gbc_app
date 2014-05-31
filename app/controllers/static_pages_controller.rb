class StaticPagesController < ApplicationController
  def home
    if signed_in?
  	  @micropost = current_user.microposts.build
  	  @feed_items = current_user.feed.paginate(page: params[:page])
      @news_post = current_user.news_posts.build
      @bulletin = current_user.bulletins.build
      @bulletins = current_user.bulletins.all

  	end
    @news_posts = NewsPost.all.paginate(page: params[:page], per_page: 5)
  end

  def help
  end

  def about
  end

  def contact
  end

  def calendar
  end
end
