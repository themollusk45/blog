class CommentsController < ApplicationController
	def create
		@post = Post.find(params[:post_id])
		@comment = @post.comments.create(params[:comment])
		redirect_to post_path(@post)
	end

	def destroy
		@comment = Comment.find(params[:id])
    	@comment.destroy
    	flash[:success] = "Comment destroyed."
    	redirect_to root_url 
  	end

  private

    def correct_user
      @comment = current_user.comments.find_by_id(params[:id])
      redirect_to root_url if @post.nil?
    end
end
