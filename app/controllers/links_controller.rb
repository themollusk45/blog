class LinksController < ApplicationController
	def create
		@user = current_user
		@link = @user.links.create(params[:link])
		redirect_to user_path(@user)
	end
	def destroy
	    Link.find(params[:id]).destroy
	    flash[:success] = "Link destroyed."
	    redirect_to users_url
  	end
end
