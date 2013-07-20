class PostsController < ApplicationController
  before_filter :signed_in_user, only: [:create, :destroy, :edit, :update]
  before_filter :correct_user, only: [:destroy, :edit, :update]

  def show
    @post = Post.find_by_id(params[:id])
    @user = @post.user
    @comment = Comment.find_by_id(params[:comment])
  end

  def create
  	@post = current_user.posts.build(params[:post])
  	if @post.save
  		flash[:success] = "Post created"
  		redirect_to root_url
  	else
      @feed_items = []
  		render 'static_pages/home'
  	end
  end

  def edit
  end

  def update
    #@post = Post.find_by_id(params[:id])
    if @post.update_attributes(params[:post])
      flash[:success] = "Post updated"
      redirect_to @post
    else
      render 'edit'
    end
  end

  def destroy
    @post.destroy
    redirect_to root_url 
  end

  private

    def correct_user
      @post = current_user.posts.find_by_id(params[:id])
      redirect_to root_url if @post.nil?
    end
end
