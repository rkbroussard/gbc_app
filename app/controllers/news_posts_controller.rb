class NewsPostsController < ApplicationController
  before_action :signed_in_user, only: [:create, :destroy]
  before_action :admin_user,     only: [:create, :destroy]

  def create
  	@news_post = current_user.news_posts.build(news_post_params)
  	if @news_post.save
  	  flash[:success] = "News Post created!"
  	  redirect_to root_url
  	else
      flash[:error] = "Your news post has no content...so I can't post it!"
      redirect_to root_url
  	end
  end

  def destroy
  	@news_post = NewsPost.find(params[:id])
    @news_post.destroy
  	redirect_to root_url
  end

  private

    def news_post_params
      params.require(:news_post).permit(:content)
    end

    def admin_user
      redirect_to(root_url) unless current_user.admin?
      @news_post = current_user.news_posts.find_by(id: params[:id])
    end
end