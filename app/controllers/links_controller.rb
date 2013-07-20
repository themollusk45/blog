class LinksController < ApplicationController
	def create
		@user = current_user
		@link = @user.links.create(params[:link])
		redirect_to user_path(@user)
	end
	def destroy
	     @link = Link.find(params[:id])
	     if @link.destroy
	      flash[:success] = "Link destroyed."
	      #redirect_to root_url#dont need ridirect, will be done with ajax eventually
        else
        	redirect_to :back
        end
  	end
end
