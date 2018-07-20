class PostsController < ApplicationController
  before_action :set_post, only: [:edit, :show, :destroy, :update]



 def index
   @posts = Post.all
 end

  def new
    @post = Post.new
  end

  def edit
  end

  def create
    #render plain: params[:post].pretty_inspect
    @post = Post.new(post_params)
    if @post.save
      flash[:notice] = "Your post has been created"
      redirect_to post_path(@post)
    else
      render 'new'
    end
  end

  def update
    if @post.update(post_params)
      flash[:notice] = "Post is getting updated"
      redirect_to post_path(@post)
    else
      render 'edit'
    end
  end

  def show
  end

 def destroy
   @post.destroy
   redirect_to posts_path
 end

  private
 def set_post
   @post = Post.find(params[:id])
 end
  def post_params
    params.require(:post).permit(:title, :body)
  end


end