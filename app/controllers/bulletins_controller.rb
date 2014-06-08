class BulletinsController < ApplicationController
  before_action :signed_in_user, only: [:create, :destroy]
  before_action :admin_user,     only: [:create, :destroy]

  def new
    @bulletin = Bulletin.new(key: params[:key])
  end

  def create
  	@bulletin = current_user.bulletins.build(bulletin_params)
  	if @bulletin.save
  	  redirect_to root_url, notice:  "The bulletin #{@bulletin.name} has
  	been created."
  	else
      flash[:error] = "Your bulletin upload name is invalid, or no file was attached."
      redirect_to root_url
  	end
  end

  def destroy
  	@bulletin = Bulletin.find(params[:id])
  	@bulletin.destroy
  	redirect_to root_url, notice:  "The bulletin #{@bulletin.name} has
  	been deleted."
  end

private
    def bulletin_params
      params.require(:bulletin).permit(:name, :attachment)
    end

    def admin_user
      redirect_to(root_url) unless current_user.admin?
      @bulletin = current_user.bulletins.find_by(id: params[:id])
    end
end
