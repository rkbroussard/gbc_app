class BulletinsController < ApplicationController
  before_action :signed_in_user, only: [:create, :destroy]
  before_action :admin_user,     only: :destroy

  def create
  	@bulletin = current_user.bulletins.build(bulletin_params)
  	if @bulletin.save
  	  flash[:success] = "The bulletin #{@bulletin.name} has been
  	  uploaded."
  	  redirect_to root_url
  	else
  	  render "static_pages/home"
  	end
  end

  def destroy
  	@bulletin.destroy
  	redirect_to root_url, notice:  "The bulletin #{@bulltin.name} has
  	been deleted."
  end

private
    def bulletin_params
      params.require(:bulletin).permit(:name, :attachment)
    end

    def admin_user
      redirect_to(root_url) unless current_user.admin?
      @bulletin = current_user.bulletin.find_by(id: params[:id])
      redirect_to root_url if @bulletin.nil?
    end
end
