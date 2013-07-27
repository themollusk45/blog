class ImagesController < ApplicationController
	before_filter :signed_in_user, only: [:create, :edit, :update, :destroy]
	before_filter :corecct_user, only: [:destroy, :update, :edit]

	def show
		@image = Image.find(params[:id])
	end

	def new
		@image = Image.new
	end

	def create
		@user = current_user
		@image = current_user.images.build(params[:image])
		if @image.save 
			flash[:success] = "image saved"
			redirect_to :back
		end
	end

	def edit
	end

	def update
		if @image.update_attributes(params[:image])
			flash[:success] = "image updated"
			redirect_to :back
		end
	end

	def destroy
		@image = Image.find(params[:id])
		@image.destroy
	end
	
	private
		
		def correct_user
			@image = current_user.images.find_by_id(params[:id])
			redirect_to root_url if @image.nil?
		end

end
