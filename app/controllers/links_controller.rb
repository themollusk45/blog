class LinksController < ApplicationController
	def create
		@user = current_user
		@link = @user.links.create(params[:link])
		respond_to do |format|
			format.html { redirect_to edit_user_path(@user) }
			format.js
		end
	end
	def destroy
	     @link = Link.find(params[:id])
	     if @link.destroy
	     	respond_to do |format|
		      format.html { flash[:success] = "Link destroyed." }
		      format.js
		      #redirect_to root_url#dont need ridirect, will be done with ajax eventually
		    end  
	     else
	        	redirect_to :back
	     end
  	end
end
