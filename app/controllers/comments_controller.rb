class CommentsController < ApplicationController
	def create
		@post = Post.find(params[:post_id])
		@comment = @post.comments.create(params[:comment])
    respond_to do |format|
      format.html { redirect_to post_path(@post) }
      format.js
    end
	end

	def destroy
		@comment = Comment.find(params[:id])
		@post = @comment.post
    @comment.destroy
    respond_to do |format|
      format.html {
        flash[:success] = "Comment destroyed."
        redirect_to @post }
      format.js
    end
 end

  	def edit
  		@post = Post.find_by_id(params[:post_id])
  		@comment = Comment.find(params[:id])
  	end

  	def update
    	@post = Post.find_by_id(params[:post_id])
    	@comment = Comment.find(params[:id])
    	if @comment.update_attributes(params[:comment])
      		flash[:success] = "comment updated"
      		redirect_to @post
    	else
    		flash[:failure] ="thre was a problem"
      		render 'edit'
    	end
  	end

  private

    def correct_user
      @comment = current_user.comments.find_by_id(params[:id])
      redirect_to root_url if @post.nil?
    end

    def admin_user
      redirect_to(root_path) unless current_user.admin?
    end
end
