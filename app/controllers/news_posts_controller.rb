class NewsPostsController < ApplicationController
  before_action :signed_in_user

  def create
  	@news_post = current_user.news_posts.build(news_post_params)
  	if @news_post.save
  	  flash[:success] = "News Post created!"
  	  redirect_to root_url
  	else
  	  render 'static_pages/home'
  	end
  end

  def destroy
  end

  private

    def news_post_params
      params.require(:news_post).permit(:content)
    end
end